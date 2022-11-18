import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/widgets/heartbeat_animation.dart';

class MainMenuHeader extends StatelessWidget {
  const MainMenuHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: paddingL),
      child: Column(
        children: [
          Text(
            'Flutter\nDesign Patterns',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: spacingM,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Created with Flutter and',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                width: spacingM,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: paddingS),
                child: HeartbeatAnimation(
                  child: Text(
                    '❤️',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
