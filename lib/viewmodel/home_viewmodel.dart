import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  final List _gymwears = [];

  List get gymwears => _gymwears;

  bool isLoad = false;

}
