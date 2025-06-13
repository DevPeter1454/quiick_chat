import 'package:flutter_test/flutter_test.dart';
import 'package:quiick_chat/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('UpdateViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
