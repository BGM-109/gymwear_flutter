import 'package:flutter/material.dart';

class ScrollService {
  static void scrollToTop(ScrollController sc) {
    sc.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
  }
}
