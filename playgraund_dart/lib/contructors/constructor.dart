
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        appBar: AppBar(title: Text('Constructor Example')),
        body: Center(child: Text('Hello, Flutter!')),
      ),
    );
  }
}


class Person {
  String name;
  int age;

  //constructor 
  person(this.name, this.age);

}

void main() {
  var p = person('Frank',22);
  print('Name: ${p.name}, Age: ${p.age}');
}