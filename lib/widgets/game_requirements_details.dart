import 'package:flutter/material.dart';

class GameRequirementsDetails extends StatelessWidget {
  final String text;

  const GameRequirementsDetails({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        text,
        style: TextStyle(color: Colors.black, fontSize: 14),
        overflow: TextOverflow.ellipsis,
      ),
      backgroundColor: Colors.grey[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );
  }
}