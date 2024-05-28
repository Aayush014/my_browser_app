// lib/providers/navigation_provider.dart
import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  bool _canGoBack = false;
  bool _canGoForward = false;

  bool get canGoBack => _canGoBack;
  bool get canGoForward => _canGoForward;

  void setCanGoBack(bool value) {
    if (_canGoBack != value) {
      _canGoBack = value;
      notifyListeners();
    }
  }

  void setCanGoForward(bool value) {
    if (_canGoForward != value) {
      _canGoForward = value;
      notifyListeners();
    }
  }
}
