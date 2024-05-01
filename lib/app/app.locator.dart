// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../repository/collection_repository.dart';
import '../repository/game_repository.dart';
import '../repository/implementations/firestore_collection_repository.dart';
import '../repository/implementations/firestore_game_repository.dart';
import '../repository/implementations/firestore_platform_repository.dart';
import '../repository/implementations/firestore_user_repository.dart';
import '../repository/platform_repository.dart';
import '../repository/user_repository.dart';
import '../services/authentication_service.dart';
import '../services/game_service.dart';
import '../services/implementations/authentication_service_impl.dart';
import '../services/implementations/game_service_impl.dart';
import '../services/implementations/user_service_impl.dart';
import '../services/user_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => NavigationService());
  locator
      .registerLazySingleton<UserRepository>(() => FirestoreUserRepository());
  locator
      .registerLazySingleton<GameRepository>(() => FirestoreGameRepository());
  locator.registerLazySingleton<CollectionRepository>(
      () => FirestoreCollectionRepository());
  locator.registerLazySingleton<PlatformRepository>(
      () => FirestorePlatformRepository());
  locator.registerLazySingleton<UserService>(() => UserServiceImpl());
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationServiceImpl());
  locator.registerLazySingleton<GameService>(() => GameServiceImpl());
}
