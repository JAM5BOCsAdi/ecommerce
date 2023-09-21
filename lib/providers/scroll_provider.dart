import 'package:flutter/material.dart';

class ScrollProvider extends ChangeNotifier {
  final _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
    notifyListeners();
  }
}
