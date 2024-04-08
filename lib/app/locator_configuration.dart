import 'package:get_it/get_it.dart';
import 'package:gameslist/service/auth_service.dart';

final locator = GetIt.I;

void setupDependencies() {
  locator.registerSingleton<AuthenticationService>(
      AuthenticationServiceImpl(locator()));
  locator.registerSingleton(Dependency());
}