import 'package:flutter/material.dart';

import 'package:flutter_lorem_picsum/screens/screens.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lorem Picsum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PicturesListScreen(),
    );
  }
}