import 'package:flutter/material.dart';
import 'package:state_mangement_provider/model/Bitcoin.dart';
import 'package:state_mangement_provider/view/bitcoin_view.dart';

import 'MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'State Mangement Provider',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '',),
    );
  }

}


