import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';

class SelectionCard extends StatelessWidget {
  final Color backgroundColor;
  final String backgroundHeroTag;
  final Text contentHeader;
  final Text contentText;
  final VoidCallback onTap;

  final double selectionCardHeight = 112.0;
  final double selectionCardBorderRadius = 10.0;

  const SelectionCard({
    super.key,
    required this.backgroundColor,
    required this.backgroundHeroTag,
    required this.contentHeader,
    required this.contentText,
    required this.onTap,
  });

  BorderRadiusGeometry get _selectionCardBorderRadius =>
      BorderRadius.circular(selectionCardBorderRadius);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Material(
          borderRadius: _selectionCardBorderRadius,
          elevation: 0,
          child: Hero(
            tag: backgroundHeroTag,
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: _selectionCardBorderRadius,
              ),
              height: selectionCardHeight,
            ),
          ),
        ),
        Material(
          borderRadius: _selectionCardBorderRadius,
          color: Colors.transparent,
          child: InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.black12,
            borderRadius: _selectionCardBorderRadius as BorderRadius,
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(paddingL),
              height: selectionCardHeight,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  contentHeader,
                  contentText,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
