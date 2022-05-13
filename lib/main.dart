import 'package:flutter/material.dart';
import 'package:gymwear_app/view/home_view.dart';
import 'package:gymwear_app/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    ));
