import 'package:flutter/material.dart';
import 'package:gymwear_app/view/home_view.dart';
import 'package:gymwear_app/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as dot_env;

void main() async {
  await dot_env.load(fileName: ".env");
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    ),
  ));
}
