import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: paddingXL,
      ),
      child: Center(
        child: Text(
          'Coming Soon!',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.white70,
              ),
        ),
      ),
    );
  }
}
