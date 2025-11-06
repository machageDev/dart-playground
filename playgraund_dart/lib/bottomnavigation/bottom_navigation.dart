import 'package:flutter/material.dart';
import 'package:playgraund_dart/buttons/buttons.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation Demo',
      theme: ThemeData(primarySwatch: Colors.brown),
      home: BottomNavExample(),
    )
  }
}

class BottomNavExample extends StatefulWidget {
  @override
  _BottomNavExampleState createState() => _BottomNavExampleState();

}

class _BottomNavExampleState extends State<BottomNavExample> {
  int _selectedIndex = 0;

  //list of screens
  final List<Widget> _pages = [
    HomeScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(()
    {
      _selectedIndex = index;// changes te screen
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

    )
  }
  

}