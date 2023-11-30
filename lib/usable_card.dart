import 'package:flutter/material.dart';

class UsableCard extends StatelessWidget {
  const UsableCard({Key? key, required this.color, this.childCard});

  final Color color;
  final Widget? childCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      height: 100.0,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: childCard,
    );
  }
}
