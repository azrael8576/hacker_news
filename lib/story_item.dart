import 'package:meta/meta.dart';

@immutable
class StoryItem {
  StoryItem({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.parts,
    this.score,
    this.text,
    this.time,
    this.title,
    this.type,
    this.url,
  });

  factory StoryItem.fromJson(Map json) {
    return StoryItem(
      by: json['by'],
      descendants: json['descendants'],
      id: json['id'],
      kids: json['kids'] != null ? json['kids'].cast<int>() : [],
      parts: json['parts'] != null ? json['parts'].cast<int>() : [],
      score: json['score'],
      text: json['text'],
      time: json['time'],
      title: json['title'],
      type: json['type'],
      url: json['url'],
    );
  }

  final String? by;
  final int? descendants;
  final int? id;
  final List<int>? kids;
  final List<int>? parts;
  final int? score;
  final String? text;
  final int? time;
  final String? title;
  final String? type;
  final String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['by'] = by;
    map['descendants'] = descendants;
    map['id'] = id;
    map['kids'] = kids;
    map['parts'] = parts;
    map['score'] = score;
    map['text'] = text;
    map['time'] = time;
    map['title'] = title;
    map['type'] = type;
    map['url'] = type;
    return map;
  }
}
