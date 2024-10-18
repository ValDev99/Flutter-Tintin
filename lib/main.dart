import 'package:flutter/material.dart';
import './screens/albums_master.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Album App',
      home: AlbumsMaster(),
    );
  }
}
