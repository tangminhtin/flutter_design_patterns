import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/data/models/design_pattern_category.dart';
import 'package:flutter_design_patterns/widgets/selection_card.dart';

class MainMenuCard extends StatelessWidget {
  final DesignPatternCategory category;

  const MainMenuCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final contentHeader = Text(
      category.title,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: 26.0,
            color: Colors.white,
          ),
      overflow: TextOverflow.ellipsis,
    );

    final contentText = Text(
      category.patterns.length == 1
          ? '${category.patterns.length} pattern'
          : '${category.patterns.length} patterns',
      style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: Colors.white,
          ),
    );

    void onSelectionCardTap() => Navigator.of(context).pushNamed(
          categoryRoute,
          arguments: category,
        );

    return SelectionCard(
      backgroundColor: Color(category.color),
      backgroundHeroTag: '${category.id}_background',
      contentHeader: contentHeader,
      contentText: contentText,
      onTap: onSelectionCardTap,
    );
  }
}
