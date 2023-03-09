import 'package:flutter/material.dart';

class OnBordingModel extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  Color color;
  OnBordingModel(
      {required this.color,
      required this.image,
      required this.title,
      required this.subtitle,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: MediaQuery.of(context).orientation == Orientation.landscape
                ? 8
                : 4,
            child: Image.asset(
              image,
              fit: BoxFit.contain,
              width: double.infinity,
            ),
          ),
          Expanded(
            flex: MediaQuery.of(context).orientation == Orientation.landscape
                ? 2
                : 1,
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.blueGrey[600],
                  fontSize: 28,
                  fontFamily: 'Changa-VariableFont_wght',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: MediaQuery.of(context).orientation == Orientation.landscape
                ? 3
                : 2,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                subtitle,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
