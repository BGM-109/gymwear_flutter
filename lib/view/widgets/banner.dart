
import 'package:flutter/material.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60.0),
      child: Column(
        children: const [
          Text(
            "Gymwear Finder",
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            "이쁜옷 안입으면 유죄",
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
