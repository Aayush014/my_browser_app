import 'package:flutter/material.dart';
import 'package:my_browser_app/Screens/Views/Components/google_screen.dart';
import 'package:provider/provider.dart';

import '../../Modal/bookmark_entry.dart';
import '../../Provider/bookmark_provider.dart';


class BookmarkPage extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookmarks'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _urlController,
              decoration: InputDecoration(labelText: 'URL'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final title = _titleController.text;
              final url = _urlController.text;
              if (title.isNotEmpty && url.isNotEmpty) {
                Provider.of<BookmarkProvider>(context, listen: false).addBookmark(
                  Bookmark(title: title, url: url),
                );
              }
            },
            child: Text('Add Bookmark'),
          ),
          Expanded(
            child: Consumer<BookmarkProvider>(
              builder: (context, bookmarkProvider, child) {
                return ListView.builder(
                  itemCount: bookmarkProvider.bookmarks.length,
                  itemBuilder: (context, index) {
                    final bookmark = bookmarkProvider.bookmarks[index];
                    return ListTile(
                      title: Text(bookmark.title),
                      subtitle: Text(bookmark.url),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          Provider.of<BookmarkProvider>(context, listen: false).removeBookmark(bookmark);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GoogleScreen(url: bookmark.url)),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
