import 'package:flutter/material.dart';
import 'package:gymwear_app/model/gymwear_model.dart';

class CustomCard extends StatelessWidget {
  final GymwearModel gm;

  const CustomCard({
    Key? key,
    required this.gm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.black, width: 2.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(gm.logo.url),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            gm.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            gm.shopLink,
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
