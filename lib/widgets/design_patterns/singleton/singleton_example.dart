import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/singleton/example_state.dart';
import 'package:flutter_design_patterns/design_patterns/singleton/example_state_base.dart';
import 'package:flutter_design_patterns/design_patterns/singleton/example_state_by_definition.dart';
import 'package:flutter_design_patterns/design_patterns/singleton/example_state_without_singleton.dart';
import 'package:flutter_design_patterns/widgets/design_patterns/singleton/singleton_example_card.dart';
import 'package:flutter_design_patterns/widgets/platform_specific/platform_button.dart';

class SingletonExample extends StatefulWidget {
  const SingletonExample({super.key});

  @override
  State<SingletonExample> createState() => _SingletonExampleState();
}

class _SingletonExampleState extends State<SingletonExample> {
  final List<ExampleStateBase> _stateList = [
    ExampleState(),
    ExampleStateByDefinition.getState(),
    ExampleStateWithoutSingleton(),
  ];

  void _setTextValues([String text = 'Singleton']) {
    for (final state in _stateList) {
      state.setStateText(text);
    }
    setState(() {});
  }

  void _reset() {
    for (final state in _stateList) {
      state.reset();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: [
            for (final state in _stateList)
              Padding(
                padding: const EdgeInsets.only(bottom: paddingL),
                child: SingletonExampleCard(
                  text: state.currentText,
                ),
              ),
            const SizedBox(height: spacingL),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _setTextValues,
              child: const Text("Change states\' text to 'Singleton'"),
            ),
            PlatformButton(
              materialColor: Colors.black,
              materialTextColor: Colors.white,
              onPressed: _reset,
              child: const Text('Reset'),
            ),
            const SizedBox(height: spacingXL),
            const Text(
              'Note: change states\' text and navigate the application (e.g. go to the tab "description" or main menu, then go back to this example) to see how the singleton state behaves!',
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
