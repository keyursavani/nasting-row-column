import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // body: LayoutBuilder(
        //   builder: (BuildContext context ,  BoxConstraints constraints) {
        //     if (constraints.maxWidth > 600) {
        //       return _buildWidgetContainer();
        //     } else {
        //       return _buildNormalContainer();
        //     }
        //   },
        // ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if(orientation ==   Orientation.landscape){
              return  _buildWidgetContainer();
            }
            return _buildNormalContainer();
          },
        ),
      ),
    );
  }
}

var stars = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
    Icon(Icons.star, color: Colors.black),
    const Icon(Icons.star, color: Colors.black),
    const Icon(Icons.star, color: Colors.black),
  ],
);

final rating = Container(
  padding: const EdgeInsets.all(15),
  child: Row(
    // mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: stars,
      ),
      Expanded(
          child: const Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Robot',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          ),
        ),
    ],
  ),
);

const descTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.w800,
  fontFamily: 'Roboto',
  letterSpacing: 0.5,
  // fontSize: 12,
  height: 2,
);

final iconList = DefaultTextStyle.merge(
  style: descTextStyle,
  child: Container(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Column(
            children: [
              Icon(Icons.kitchen, color: Colors.green),
              const Text('PREP:'),
              const Text('25 min'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Icon(Icons.timer, color: Colors.green),
              const Text('COOK:'),
              const Text('1 hr'),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Icon(Icons.restaurant, color: Colors.green),
              const Text('FEEDS:'),
              const Text('4-6'),
            ],
          ),
        ),
      ],
    ),
  ),
);

final leftColumn = Container(
  padding: const EdgeInsets.fromLTRB(5, 30, 5, 15),
  child: Column(
    children: [
      titleText,
      subTitle,
      rating,
      iconList,
    ],
  ),
);

final titleText = Padding(padding: const EdgeInsets.all(12),
    child: Text(
  "Strawberry Pavlova",
  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
    ),
);

final subTitle = Text(
    "Pavlova is a meringue-based desert named after the Russian ballerina anna Pavlova."
    " Pavlova fealures a erisp erusl and soft, light inside, lopper with fruit and"
    " whipped cream.");

final mainImage = Image.asset(
  'assets/images/mixed-berries.jpg',
  fit: BoxFit.fill,
);

Widget _buildNormalContainer(){
  return Center(
    child: Container(
      padding: const EdgeInsets.fromLTRB(5,40,5,10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
          Expanded(
          child: mainImage,
             ),
            Expanded(
              child: SizedBox(
                child: leftColumn,
              ),
            ),
          ],
        ),
      ),
  );
}

Widget _buildWidgetContainer(){
  return Center(
    child: Container(
      padding: const EdgeInsets.fromLTRB(5,40,5,10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Expanded(
              child: mainImage,
            ),
          Expanded(
            child: SizedBox(
              child: leftColumn,
            ),
          ),
        ],
      ),
    ),
  );
}
