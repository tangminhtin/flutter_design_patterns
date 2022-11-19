import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';

class SingletonExampleCard extends StatelessWidget {
  final String text;

  const SingletonExampleCard({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 64.0,
        padding: const EdgeInsets.all(paddingL),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
