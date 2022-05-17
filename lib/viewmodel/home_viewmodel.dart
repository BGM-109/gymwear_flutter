import 'package:flutter/material.dart';
import 'package:gymwear_app/core/network_service.dart';
import 'package:gymwear_app/model/gymwear_model.dart';

class HomeViewModel extends ChangeNotifier {

  List<GymwearModel> _gymwears = [];

  List get gymwears => _gymwears;

  bool isLoad = false;

  void getGymwears() async {
    isLoad = true;
    _gymwears = await Network.getGymwears();

    isLoad = false;
    notifyListeners();
  }
  HomeViewModel() {
    getGymwears();
  }
}
