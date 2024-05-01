// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i11;
import 'package:flutter/material.dart';
import 'package:gameslist/ui/views/collection/collection_view.dart' as _i8;
import 'package:gameslist/ui/views/game_details/game_details_view.dart' as _i10;
import 'package:gameslist/ui/views/home/home_view.dart' as _i7;
import 'package:gameslist/ui/views/main/main_view.dart' as _i2;
import 'package:gameslist/ui/views/profile/profile_view.dart' as _i9;
import 'package:gameslist/ui/views/sign_in/sign_in_view.dart' as _i4;
import 'package:gameslist/ui/views/sign_up/sign_up_view.dart' as _i6;
import 'package:gameslist/ui/views/startup/startup_view.dart' as _i3;
import 'package:gameslist/ui/views/welcome/welcome_view.dart' as _i5;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i12;

class Routes {
  static const mainView = '/main-view';

  static const startupView = '/startup-view';

  static const signInView = '/sign-in-view';

  static const welcomeView = '/welcome-view';

  static const signUpView = '/sign-up-view';

  static const homeView = '/home-view';

  static const collectionView = '/collection-view';

  static const profileView = '/profile-view';

  static const gameDetailsView = '/game-details-view';

  static const all = <String>{
    mainView,
    startupView,
    signInView,
    welcomeView,
    signUpView,
    homeView,
    collectionView,
    profileView,
    gameDetailsView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.mainView,
      page: _i2.MainView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.signInView,
      page: _i4.SignInView,
    ),
    _i1.RouteDef(
      Routes.welcomeView,
      page: _i5.WelcomeView,
    ),
    _i1.RouteDef(
      Routes.signUpView,
      page: _i6.SignUpView,
    ),
    _i1.RouteDef(
      Routes.homeView,
      page: _i7.HomeView,
    ),
    _i1.RouteDef(
      Routes.collectionView,
      page: _i8.CollectionView,
    ),
    _i1.RouteDef(
      Routes.profileView,
      page: _i9.ProfileView,
    ),
    _i1.RouteDef(
      Routes.gameDetailsView,
      page: _i10.GameDetailsView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.MainView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.MainView(),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    _i4.SignInView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i4.SignInView(),
        settings: data,
      );
    },
    _i5.WelcomeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i5.WelcomeView(),
        settings: data,
      );
    },
    _i6.SignUpView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i6.SignUpView(),
        settings: data,
      );
    },
    _i7.HomeView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i7.HomeView(),
        settings: data,
      );
    },
    _i8.CollectionView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i8.CollectionView(),
        settings: data,
      );
    },
    _i9.ProfileView: (data) {
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => const _i9.ProfileView(),
        settings: data,
      );
    },
    _i10.GameDetailsView: (data) {
      final args = data.getArgs<GameDetailsViewArguments>(nullOk: false);
      return _i11.MaterialPageRoute<dynamic>(
        builder: (context) => _i10.GameDetailsView(args.gameId, key: args.key),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class GameDetailsViewArguments {
  const GameDetailsViewArguments({
    required this.gameId,
    this.key,
  });

  final String gameId;

  final _i11.Key? key;

  @override
  String toString() {
    return '{"gameId": "$gameId", "key": "$key"}';
  }

  @override
  bool operator ==(covariant GameDetailsViewArguments other) {
    if (identical(this, other)) return true;
    return other.gameId == gameId && other.key == key;
  }

  @override
  int get hashCode {
    return gameId.hashCode ^ key.hashCode;
  }
}

extension NavigatorStateExtension on _i12.NavigationService {
  Future<dynamic> navigateToMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToWelcomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.welcomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToCollectionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.collectionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToGameDetailsView({
    required String gameId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.gameDetailsView,
        arguments: GameDetailsViewArguments(gameId: gameId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithMainView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.mainView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignInView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signInView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithWelcomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.welcomeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithSignUpView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.signUpView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithCollectionView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.collectionView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithProfileView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.profileView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithGameDetailsView({
    required String gameId,
    _i11.Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return replaceWith<dynamic>(Routes.gameDetailsView,
        arguments: GameDetailsViewArguments(gameId: gameId, key: key),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
