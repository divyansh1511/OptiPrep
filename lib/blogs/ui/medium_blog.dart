import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class MediumBlogPost {
  final String title;
  final String content;

  MediumBlogPost({required this.title, required this.content});
}

class MediumBlogsScreen extends StatefulWidget {
  @override
  _MediumBlogsScreenState createState() => _MediumBlogsScreenState();
}

class _MediumBlogsScreenState extends State<MediumBlogsScreen> {
  List<MediumBlogPost> blogPosts = [];

  @override
  void initState() {
    super.initState();
    fetchMediumBlogs();
  }

  Future<void> fetchMediumBlogs() async {
    // Replace the URL with the actual RSS feed URL for the Medium user/publication
    final url = 'https://divyansh_garg.medium.com/feed';
    // final response;
    try {
      print("hey");
      final response = await http.get(Uri.parse(url));
      print(response.statusCode);

      if (response.statusCode == 200) {
        final parsedXml = xml.parse(response.body);
        final items = parsedXml.findAllElements('item');

        List<MediumBlogPost> posts = [];
        for (var item in items) {
          final title = item.findElements('title').single.text;
          final content = item.findElements('content:encoded').single.text;
          posts.add(MediumBlogPost(title: title, content: content));
        }

        setState(() {
          blogPosts = posts;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medium Blogs'),
      ),
      body: ListView.builder(
        itemCount: blogPosts.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(blogPosts[index].title),
              subtitle: Text(blogPosts[index].content),
            ),
          );
        },
      ),
    );
  }
}
