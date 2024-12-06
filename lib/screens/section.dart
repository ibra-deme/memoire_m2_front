import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  final String title;
  final String description;

  Section({required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        contentPadding: EdgeInsets.all(15),
        title: Text(title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
      ),
    );
  }
}
