import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/data/models/design_pattern.dart';
import 'package:flutter_design_patterns/widgets/selection_card.dart';

class DesignPatternCard extends StatelessWidget {
  final DesignPattern designPattern;

  const DesignPatternCard({
    super.key,
    required this.designPattern,
  });

  @override
  Widget build(BuildContext context) {
    final contentHeader = Text(
      designPattern.title,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontSize: 26.0,
          ),
      overflow: TextOverflow.ellipsis,
    );

    final contentText = Text(
      designPattern.description,
      style: Theme.of(context).textTheme.bodyMedium,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );

    void onSelectionCardTap() => Navigator.of(context).pushNamed(
          designPattern.route,
          arguments: designPattern,
        );

    return SelectionCard(
      backgroundColor: lightBackgroundColor,
      backgroundHeroTag: '${designPattern.id}_background',
      contentHeader: contentHeader,
      contentText: contentText,
      onTap: onSelectionCardTap,
    );
  }
}
