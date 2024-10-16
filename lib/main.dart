// import 'package:bab3/assetsLokal.dart';

import 'bab 3/stack.dart';
import 'bab 3/padding.dart';
import 'bab 3/align.dart';
import 'bab 3/elevatedbutton.dart';
import 'bab 3/textfield.dart';
import 'bab 3/imageInternet.dart';
import 'bab 3/assetsLokal.dart';
import 'bab 3/penerapanContainer.dart';
import 'bab 3/icons.dart';

import 'bab 4/bab4listviewBuilder.dart';
import 'bab 4/bab4separated.dart';
import 'bab 4/bab4custom.dart';
import 'bab 4/bab4default.dart';

import 'bab 5/bab5gridviewBuilder.dart';
import 'bab 5/bab5custom.dart';
import 'bab 5/bab5count.dart';
import 'bab 5/bab5extent.dart';

import 'bab 6/bab6pushnpop.dart';
import 'bab 6/bab6replacement.dart';
import 'bab 6/bab6pushnremoveuntil.dart';
import 'bab 6/bab6homescreen.dart';
import 'bab 6/bab6detailscreen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const TextfieldPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
