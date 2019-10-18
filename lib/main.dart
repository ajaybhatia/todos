import 'package:flutter/material.dart';
import 'package:todos/ui/screens/Home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    ));
