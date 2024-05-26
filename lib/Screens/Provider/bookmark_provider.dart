import 'package:flutter/material.dart';

import '../Modal/bookmark_entry.dart';

class BookmarkProvider with ChangeNotifier {
  final List<Bookmark> _bookmarks = [];

  List<Bookmark> get bookmarks => _bookmarks;

  void addBookmark(Bookmark bookmark) {
    _bookmarks.add(bookmark);
    notifyListeners();
  }

  void removeBookmark(Bookmark bookmark) {
    _bookmarks.remove(bookmark);
    notifyListeners();
  }
}
