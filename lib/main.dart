import 'package:flutter/material.dart';
import 'package:pokemon/maps/pokelab.dart';
import './maps/root.dart';
import './characters/boy.dart';
import 'button.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  /*Variables 
*/
  double mapX = 0.375;
  double mapY = 0.15;

  double labMapX = 0;
  double labMapY = 0;

  //boy character
  int boySpriteCount = 0;
  String boyDirection = 'Down';

  String currentLocation = 'littleroot';
  double step = 0.15;
  static double stepLab = 0.43;
  //no mans land for pokelab
  //// x:0.125, y-0.09999999999999998
  List<List<double>> noMansLandLab = [
    [0.5, 0.5],
    [0.625, -0.35],
    [0.375, -0.35],
    [0.125, -0.35],
    [1.625, -0.6],
    [1.375, -0.6],
    [1.125, -0.6],
    [0.875, -0.6],
    [0.625, -0.6],
    [0.375, -0.6],
    [1.625, -0.6],
    [1.375, -0.85],
    [1.125, -0.85],
    [0.875, -0.85],
    [0.625, -0.85],
    [0.375, -0.85],
    [0.125, -0.85],
    [1.625, -1.1],
    [1.375, -1.1],
  ];

  //no mans land for littleroot
  List<List<double>> noMansLandLittleroot = [
    [0.625, 0.15],
    [0.875, 0.15],
    [0.625, 0.4],
    [0.875, 0.4],
    [0.625, 0.65],
    [0.875, 0.65],
    [0.625, 0.9],
    [0.875, 0.9],
    [0.625, 1.15],
    [0.875, 1.15],
    [0.625, 1.4],
    [0.875, 1.4],
    [0.375, 1.4],
    [0.375, 1.65],
    [0.375, 1.9],
    [0.375, 2.15],
    [0.375, 2.4],
    [0.375, 2.65],
    [0.375, 2.9],
    [0.125, 3.4],
    [-0.125, 3.4],
    [-0.625, 3.4],
    [-0.125, 3.4],
    [-0.125, 3.4],
    [-0.125, 3.65],
    [-0.125, 3.9],
    [-0.125, 3.4],
    [-0.125, 4.15],
    [-0.375, 4.4],
    [-0.625, 4.4],
    [-0.875, 4.4],
    [-1.125, 4.4],
    [-1.375, 4.4],
    [-1.625, 4.4],
    [-1.625, 4.65],
    //[-1.625, 4.4],
    [-1.625, 4.9],
    [-1.625, 5.15],
    [-1.625, 5.4],
    [-1.625, 5.15],
    [-1.375, 5.65],
    [-1.625, 5.15],
    [-1.375, 5.9],
    [-1.125, 5.9],
    [-0.875, 5.9],
    [-0.875, 6.15],
    [-1.125, 5.9],
    [-0.625, 6.4],
    [-0.625, 6.65],
    [-0.375, 6.65],
    [-0.125, 6.65],
    [0.125, 6.15],
    [0.375, 5.9],
    [0.625, 5.9],
    [0.875, 5.9],
    [1.125, 5.9],
    [1.375, 5.4],
    [1.375, 5.15],
    [1.375, 4.9],
    [1.375, 4.65],
    [1.375, 4.4],
    [1.625, 4.15],
    [2.125, 4.65],
    [1.625, 3.65],
    [1.625, 3.40],
    [1.875, 3.15],
    [2.375, 3.40],
    [1.875, 3.15],
    [2.375, 3.15],
    [2.375, 3.15],
    [2.375, 2.90],
    [1.875, 2.90],
    [2.375, 2.65],
    [1.875, 2.65],
    [2.375, 2.40],
    [1.875, 2.40],
    [2.375, 2.15],
    [1.875, 2.15],
    [2.375, 1.90],
    [1.875, 1 - 90],
    [2.375, 1.65],
    [1.875, 1.65],
    [2.375, 1.10],
    [1.875, 1.40],
    [2.375, 1.15],
    [1.875, 1.15],
    [2.375, 0.90],
    [1.875, 0.90],
    [2.375, 0.65],
    [1.875, 0.65],
    [2.375, 0.40],
    [1.875, 0.40],
    [2.375, 0.15],
    [1.875, 0.15],
    [2.375, -0.09],
    [1.875, -0.09],
    [2.375, -0.35],
    [1.875, -0.35],
    [2.375, -0.60],
    [2.125, -0.85],
    [1.875, -0.35],
    [1.625, -0.09],
    [1.375, -0.35],
    [1.375, -0.60],
    [1.375, -0.85],
    [1.375, -1.09],
    [1.375, -1.35],
    [1.375, -1.60],
    [1.375, -1.85],
    [1.375, -2.09],
    [1.375, -1.35],
    [1.375, -2.60],
    [2.125, -2.60],
    [1.875, -2.09],
    [1.875, -1.85],
    [1.875, -1.60],
    [2.125, -1.60],
    [2.125, -2.60],
    [2.125, -2.85],
    [2.125, -2.09],
    [2.125, -3.35],
    [2.125, -3.60],
    [1.625, -2.85],
    [1.625, -3.09],
    [1.625, -3.35],
    [1.625, -3.60],
    [1.625, -3.85],
    [1.625, -4.1],
    [1.625, -4.35],
    [1.625, -4.6],
    [1.625, -4.85],
    [1.625, -5.1],
    [1.625, -5.35],
    [1.625, -5.6],
    [1.625, -5.85],
    [1.625, -6.1],
    [1.625, -6.35],
    [1.625, -6.6],
    [2.375, -6.6],
    [2.375, -6.35],
    [2.375, -6.1],
    [2.375, -5.85],
    [2.375, -5.6],
    [2.375, -5.35],
    [2.375, -5.1],
    [2.375, -4.85],
    [2.375, -4.6],
    [2.375, -4.35],
    [2.375, -4.1],
    [-0.125, 0.15],
    [-0.125, 0.4],
    [-0.125, 0.65],
    [-0.125, 0.9],
    [-0.125, 1.15],
    [-0.125, 1.4],
    [-0.125, 1.65],
    [-0.125, 1.9],
    [-0.125, 2.15],
    [-0.125, 2.4],
    [-0.125, 2.65],
    [-0.375, 2.65],
    [-0.625, 2.65],
    [-0.875, 2.65],
    [-1.125, 2.65],
    [-1.125, 2.9],
    [-0.875, 3.15],
    [-0.125, 2.65],
    [-0.625, 3.65],
    [-0.875, 3.65],
    [-1.125, 3.65],
    [-1.375, 3.65],
    [-1.625, 3.15],
    [-1.625, 2.90],
    [-1.875, 2.90],
    [-2.125, 2.90],
    [-2.125, 3.15],
    [-2.125, 3.40],
    [-2.125, 3.65],
    [-2.125, 3.90],
    [-2.125, 4.15],
    [-2.125, 4.4],
    [-2.125, 4.65],
    [-2.125, 4.9],
    [-2.125, 5.15],
    [-2.125, 5.4],
    [-2.125, 5.65],
    [-2.125, 5.9],
    [-2.125, 6.15],
    [-2.125, 6.4],
    [-2.125, 6.65],
    [-2.125, 6.9],
    [-2.125, 7.15],
    [-2.125, 7.4],
    [-1.875, 7.4],
    [-1.625, 7.4],
    [-1.375, 7.4],
    [-1.125, 7.4],
    [-0.875, 7.4],
    [-0.625, 7.4],
    [-0.375, 7.4],
    [-0.375, 7.65],
    [-0.125, 7.65],
    [0.125, 7.65],
    [0.375, 7.65],
    [0.375, 7.4],
    [0.375, 7.15],
    [0.375, 6.9],
    [0.375, 6.65],
    [0.625, 6.4],
    [0.875, 6.4],
    [1.125, 6.4],
    [1.375, 6.4],
    [1.625, 6.4],
    [1.875, 6.4],
    [2.125, 6.4],
    [2.125, 6.15],
    [2.125, 5.9],
    [2.125, 5.65],
    [2.125, 5.4],
    [2.125, 5.15],
    [2.125, 4.9],
    [2.125, 4.9],
    [2.125, 4.15],
    [2.125, 3.9],
    [2.375, 3.65],
    [2.375, 3.65],
    [1.625, -0.09],
    [1.375, -0.09],
    [2.125, -1.35],
    [2.125, -1.09],
    [2.125, -1.35],
    [1.875, -2.09],
    [2.125, -3.09],
    [1.875, -2.09],
    [2.375, -3.85],
    [1.375, -2.09],
    [1.375, -2.35],
    [0.625, -0.1],
    [0.625, -0.35],
    [0.625, -0.6],
    [0.625, -0.85],
    [0.625, -1.1],
    [0.625, -1.85],
    [0.625, -2.1],
    [0.625, -2.35],
    [0.375, -2.35],
    [0.125, -2.35],
    [-0.125, -2.35],
    [0.125, -2.1],
    [0.125, -1.85],
    [0.125, -1.6],
    [0.125, -1.35],
    [0.125, -1.1],
    [0.125, -0.85],
    [0.125, -0.60],
    [0.125, -0.35],
    [0.125, -0.10],
    [0.125, -2.35],
    [2.125, 4.4],
    [1.375, 3.9],
    [2.125, 4.4],
    [1.625, -0.35],
    [1.875, 1.90],
    [2.375, 1.40],
    [2.375, -0.09],
    [1.875, -0.09],
    [1.625, -0.09],
    [1.375, -1.09],
    [1.625, -1.09],
    [1.875, -2.09],
    [1.625, -3.09],
    [2.125, -3.09],
    [2.125, -3.09],
    [0.625, -1.35],
    [0.625, -1.6],
    [-0.125, 6.4],
    [1.375, -1.09],
    [1.375, -2.09],
    [1.875, -2.09],
    [2.125, -2.09],
    [2.125, -2.35],
    [1.625, -3.09],
    [2.125, -3.09],
    [2.125, -2.09],
    [1.375, -1.09],
    [1.375, -2.09],
  ];

  void moveUp() {
    boyDirection = "Up";
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY += step;
        });
      }

      //enter pokelab

      if (double.parse((mapX).toStringAsFixed(4)) == 2.125 &&
          double.parse((mapY).toStringAsFixed(4)) == -6.85) {
        setState(() {
          print("Başardın!");
          currentLocation = 'pokelab';
          labMapX = 0;
          labMapY = -2.73;
        });
      }

      animateWalk();
    }
  }

  // Tussss
  void moveDown() {
    boyDirection = "Down";
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapY -= step;
        });
      }
      if (double.parse((mapX).toStringAsFixed(4)) == 2.125 &&
          double.parse((mapY).toStringAsFixed(4)) == -6.85) {
        setState(() {
          print("Başardın!");
          currentLocation = 'pokelab';
          labMapX = 0;
          labMapY = -2.73;
        });
      }
      animateWalk();
    }
  }
  // ||  canMoveTo(boyDirection, noMansLandMyPokeLab, mapX, mapY)
  //  || currentLocation == 'MyPokeLab'

  void moveLeft() {
    boyDirection = "Left";
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX += step;
        });
      }
      if (double.parse((mapX).toStringAsFixed(4)) == 2.125 &&
          double.parse((mapY).toStringAsFixed(4)) == -6.85) {
        setState(() {
          print("Başardın!");
          currentLocation = 'pokelab';
          labMapX = 0;
          labMapY = -2.73;
        });
      }
      animateWalk();
    }
  }

  void moveRight() {
    boyDirection = "Right";
    if (currentLocation == 'littleroot') {
      if (canMoveTo(boyDirection, noMansLandLittleroot, mapX, mapY)) {
        setState(() {
          mapX -= step;
        });
      }
      if (double.parse((mapX).toStringAsFixed(4)) == 2.125 &&
          double.parse((mapY).toStringAsFixed(4)) == -6.85) {
        setState(() {
          print("Başardın!");
          currentLocation = 'pokelab';
          labMapX = 0;
          labMapY = -2.73;
        });
      }
      animateWalk();
    }
  }

  void pressedA() {}

  void pressedB() {}

  void animateWalk() {
    print('x:' + mapX.toString() + ', y:' + mapY.toString());

    Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        boySpriteCount++;
      });
      if (boySpriteCount == 3) {
        boySpriteCount = 0;
        timer.cancel();
      }
    });
  }

  double clearNum(double num) {
    return double.parse(num.toStringAsFixed(4));
  }

  bool canMoveTo(String direction, var noMansLand, double x, double y) {
    double stepX = 0;
    double stepY = 0;

    if (direction == 'Left') {
      stepX = step;
      stepY = 0;
    } else if (direction == 'Right') {
      stepX = -step;
      stepY = 0;
    } else if (direction == 'Up') {
      stepX = 0;
      stepY = step;
    } else if (direction == 'Down') {
      stepX = 0;
      stepY = -step;
    }
    for (int i = 0; i < noMansLand.length; i++) {
      if ((clearNum(noMansLand[i][0]) == clearNum(x + stepX)) &&
          (clearNum(noMansLand[i][1]) == clearNum(y + stepY))) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == 'littleroot') {
      step = 0.25;
    } else if (currentLocation == 'pokelab') {
      step = 0.43;
    }
    return Scaffold(
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
                color: Color(0xfff4b85d),
                child: Stack(
                  children: [
                    //Root
                    LittleRoot(
                      x: mapX,
                      y: mapY,
                      currentMap: currentLocation,
                    ),

                    MyPokeLab(
                      x: labMapX,
                      y: labMapY,
                      currentMap: currentLocation,
                    ),

                    Container(
                      alignment: Alignment(0, 0),
                      child: MyBoy(
                        location: currentLocation,
                        boySpriteCount: boySpriteCount,
                        direction: boyDirection,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 20, color: Colors.orange)),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Container(
              color: Color(0xffc86102),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'P İ K A - Ç U U U U U ',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '←',
                                  function: moveLeft,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: '↑',
                                  function: moveUp,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '↓',
                                  function: moveDown,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: '→',
                                  function: moveRight,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                                MyButton(
                                  text: 'b',
                                  function: pressedB,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyButton(
                                  text: 'a',
                                  function: pressedA,
                                ),
                                Container(
                                  height: 50,
                                  width: 50,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Text('BY--SEFACATALBAS',
                        style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
