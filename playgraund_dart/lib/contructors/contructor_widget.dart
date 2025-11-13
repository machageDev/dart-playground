import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final int age;
  final String email;

  const ProfileCard({
    required this.name,
    required this.age,
    required this.email,
    super.key
,  });

// Names constructor
const ProfileCard.guest({super.key})
      : name = 'Guest',
        age = 0,
        email = ';


@override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 18)),
            Text('Age: $age', style: TextStyle(fontSize: 18)),
            Text('Email: $email', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }







}