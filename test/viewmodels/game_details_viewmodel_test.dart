import 'package:flutter_test/flutter_test.dart';
import 'package:gameslist/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('GameDetailsViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
