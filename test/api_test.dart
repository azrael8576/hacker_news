import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:hacker_news/api.dart';

void main() {
  group('API test', () {
    test('Test API call', () async {
      var results = await getTopStories();

      expect(results.isNotEmpty, true);
      expect(results is List<int>, isTrue);
    });

    test('Test getItem', () async {
      final results = await getItem(1);
      expect(results.id, 1);
    });

    test('Another test', () async {
      Stream stream = getTopStoriesWithDetails();
      Completer completer = Completer();
      stream.listen((event) {
        print(event);
        completer.complete();
      });
      await completer.future;
    });
  });
}
