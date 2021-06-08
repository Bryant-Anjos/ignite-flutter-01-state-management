import 'package:flutter_test/flutter_test.dart';
import 'package:state_management/state_management.dart';

void main() {
  late StateManagement<String> controller;

  setUp(() {
    controller = StateManagement<String>(initialState: "");
  });

  test("Testing the setState", () {
    expect(controller.state, "");

    controller.setState("Modified");
    expect(controller.state, "Modified");

    controller.setState("Modified2");
    expect(controller.state, "Modified2");
  });

  test("Testing the listen", () {
    expect(controller.state, "");

    controller.listen((state) {
      expect(controller.state, "Modified");
    });

    controller.setState("Modified");
  });

  test("Testing the unsubscribe", () {
    expect(controller.state, "");

    final unsubscribe = controller.listen((state) {
      expect(controller.state, "Modified");
    });
    controller.setState("Modified");

    unsubscribe();
    final unsubscribe2 = controller.listen((state) {
      expect(controller.state, "Modified2");
    });
    controller.setState("Modified2");

    unsubscribe2();
    controller.listen((state) {
      expect(controller.state, "Modified3");
    });
    controller.setState("Modified3");
  });
}
