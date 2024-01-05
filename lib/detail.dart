import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hacker_news/api.dart';
import 'package:hacker_news/story_item.dart';

class DetailPage extends StatefulWidget {
  final int id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: FutureBuilder<StoryItem>(
        future: getItem(widget.id),
        builder: (context, snapshot) {
          var fetchedData = snapshot.data;
          if (fetchedData == null) {
            return Container();
          }

          return Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${fetchedData.id}'),
                      Text('${fetchedData.type}'),
                      Text('${fetchedData.title}'),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
