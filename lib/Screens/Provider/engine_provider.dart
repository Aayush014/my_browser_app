// lib/providers/history_provider.dart
import 'package:flutter/material.dart';

import '../../Utils/url_utils.dart';
import '../Modal/history_entry.dart';


class HistoryProvider with ChangeNotifier {
  List<HistoryEntry> _history = [];

  List<HistoryEntry> get history => _history;

  void addHistoryEntry(String title, String url) {
    final domainName = getDomainName(url);
    _history.add(HistoryEntry(title: title, timestamp: DateTime.now()));
    notifyListeners();
  }

  void clearHistory() {
    _history.clear();
    notifyListeners();
  }
}
