import 'package:flutter/material.dart';
import 'package:hacker_news/api.dart';
import 'package:hacker_news/story_item.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder<List<StoryItem>>(
            stream: getTopStoriesWithDetails(),
            builder: (context, snapshot) {
              if (!snapshot.hasData && !snapshot.hasError) {
                return const Center(child: Text('Fetching'));
              }

              if (snapshot.hasError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Error ${snapshot.error}',
                      maxLines: 1,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text('Retry'),
                    )
                  ],
                ));
              }

              return Scrollbar(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = snapshot.data![index];

                      return ListTile(
                        onTap: () {
                          // final url = item.url;
                          // if (url == null) return;
                          //
                          // launchUrlString(url);
                          final id = item.id;
                          if (id == null) return;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPage(id: id)));
                        },
                        leading: ClipOval(
                            child: Image.network(
                                'https://cdn.pixabay.com/photo/2016/12/03/15/44/fireworks-1880045_1280.jpg')),
                        title: Text(
                          '${item.title}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        subtitle: Text(item.by ?? ''),
                      );
                    },
                    itemCount: snapshot.data?.length ?? 0),
              );
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
