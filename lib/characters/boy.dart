import 'package:flutter/material.dart';

class MyBoy extends StatelessWidget {
  final int boySpriteCount;
  final String direction;
  final String location;
  double height = 20;
  MyBoy({
    Key? key,
    required this.boySpriteCount,
    required this.direction,
    required this.location,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (location == 'littleroot') {
      height = 20;
    } else if (location == 'pokelab') {
      height = 30;
    } else if (location == 'battleground' ||
        location == 'attackoptions' ||
        location == 'battlefinishedscreen') {
      height = 0;
    }
    return Container(
      height: height,
      child: Image.asset(
        'lib/assets/boy' + direction + boySpriteCount.toString() + '.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
