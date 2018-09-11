import 'package:xml/xml.dart' as xml;

import 'feed_enclosure.dart';

class NewsItem {
  final String news_item_title;
  final String news_item_snippet;
  final String news_item_url;
  final String news_item_source;

  NewsItem({
    this.news_item_title,
    this.news_item_snippet,
    this.news_item_url,
    this.news_item_source,
  });

  factory NewsItem.fromXml(xml.XmlElement node) {
    // Optional fields:
    String news_item_title;
    try {
      news_item_title = node.findElements('news_item_title', namespace: 'https://trends.google.com/trends/trendingsearches/daily').single.text;
    } catch (e) {}

    String news_item_snippet;
    try {
      news_item_snippet = node.findElements('news_item_snippet', namespace: 'https://trends.google.com/trends/trendingsearches/daily').single.text;
    } catch (e) {}

    String news_item_url;
    try {
      news_item_url = node.findElements('news_item_url', namespace: 'https://trends.google.com/trends/trendingsearches/daily').single.text;
    } catch (e) {}

    String news_item_source;
    try {
      news_item_source = node.findElements('news_item_source', namespace: 'https://trends.google.com/trends/trendingsearches/daily').single.text;
    } catch (e) {}

    return new NewsItem(
      news_item_title: news_item_title,
      news_item_snippet: news_item_snippet,
      news_item_url: news_item_url,
      news_item_source: news_item_source,
    );
  }

  String toString() {
    return '''
      news_item_title: $news_item_title
      news_item_snippet: $news_item_snippet
      news_item_url: $news_item_url
      news_item_source: $news_item_source
      ''';
  }
}
