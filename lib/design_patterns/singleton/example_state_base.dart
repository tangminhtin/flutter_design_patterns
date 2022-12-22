abstract class ExampleStateBase {
  late String initialText;
  late String stateText;

  String get currentText => stateText;

  void setStateText(String text) {
    stateText = text;
  }

  void reset() {
    stateText = initialText;
  }
}
