import 'package:flutter/material.dart';
import 'package:flutter_progress_status/flutter_progress_status.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Progress Status Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ProgressStatus(
          radius: 150,
          strokeWidth: 20,
          fillValue: 0,
        ),
      ),
    );
  }
}
