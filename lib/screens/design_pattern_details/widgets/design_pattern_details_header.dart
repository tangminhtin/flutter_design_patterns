import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/data/models/design_pattern.dart';

class DesignPatternDetailsHeader extends StatelessWidget {
  final DesignPattern designPattern;

  const DesignPatternDetailsHeader({
    super.key,
    required this.designPattern,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              designPattern.title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 32.0,
                  ),
            ),
          ],
        ),
        const SizedBox(height: spacingL),
        Row(
          children: [
            Expanded(
              child: Text(
                designPattern.description,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                maxLines: 99,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
