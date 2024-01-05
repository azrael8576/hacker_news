import 'package:dio/dio.dart';
import 'package:hacker_news/story_item.dart';

var dio = Dio();

class SampleClass {
  void test() {}
}

Future<StoryItem> getItem(int itemId) async {
  final response = await dio.get(
      'https://hacker-news.firebaseio.com/v0/item/$itemId.json?print=pretty');

  if (response.statusCode == 200) {
    Map item = response.data;
    return StoryItem.fromJson(item);
  } else {
    throw Exception('Failed to load top stories');
  }
}

Future<List<int>> getTopStories() async {
  final response = await dio.get(
      'https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty');

  if (response.statusCode == 200) {
    List topStories = response.data;
    return topStories.cast<int>();
  } else {
    throw Exception('Failed to load top stories');
  }
}

Stream<List<StoryItem>> getTopStoriesWithDetails() async* {
  final idList = (await getTopStories()).sublist(0, 10);
  var result = <StoryItem>[];
  for (var id in idList) {
    print('id $id');
    final item = await getItem(id);
    result.add(item);
    yield result;
  }
}
