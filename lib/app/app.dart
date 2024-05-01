import 'package:gameslist/repository/collection_repository.dart';
import 'package:gameslist/repository/game_repository.dart';
import 'package:gameslist/repository/implementations/firestore_collection_repository.dart';
import 'package:gameslist/repository/implementations/firestore_game_repository.dart';
import 'package:gameslist/repository/implementations/firestore_platform_repository.dart';
import 'package:gameslist/repository/implementations/firestore_user_repository.dart';
import 'package:gameslist/repository/platform_repository.dart';
import 'package:gameslist/repository/user_repository.dart';
import 'package:gameslist/services/authentication_service.dart';
import 'package:gameslist/services/game_service.dart';
import 'package:gameslist/services/implementations/authentication_service_impl.dart';
import 'package:gameslist/services/implementations/game_service_impl.dart';
import 'package:gameslist/services/implementations/user_service_impl.dart';
import 'package:gameslist/services/user_service.dart';
import 'package:gameslist/ui/dialogs/edit_profile/edit_profile_dialog.dart';
import 'package:gameslist/ui/views/collection/collection_view.dart';
import 'package:gameslist/ui/views/game_details/game_details_view.dart';
import 'package:gameslist/ui/views/home/home_view.dart';
import 'package:gameslist/ui/views/main/main_view.dart';
import 'package:gameslist/ui/views/profile/profile_view.dart';
import 'package:gameslist/ui/views/sign_in/sign_in_view.dart';
import 'package:gameslist/ui/views/sign_up/sign_up_view.dart';
import 'package:gameslist/ui/views/startup/startup_view.dart';
import 'package:gameslist/ui/views/welcome/welcome_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: MainView),
  MaterialRoute(page: StartupView),
  MaterialRoute(page: SignInView),
  MaterialRoute(page: WelcomeView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: CollectionView),
  MaterialRoute(page: ProfileView),
  MaterialRoute(page: GameDetailsView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: FirestoreUserRepository, asType: UserRepository),
  LazySingleton(classType: FirestoreGameRepository, asType: GameRepository),
  LazySingleton(
      classType: FirestoreCollectionRepository, asType: CollectionRepository),
  LazySingleton(
      classType: FirestorePlatformRepository, asType: PlatformRepository),
  LazySingleton(classType: UserServiceImpl, asType: UserService),
  LazySingleton(
      classType: AuthenticationServiceImpl, asType: AuthenticationService),
  LazySingleton(classType: GameServiceImpl, asType: GameService),
// @stacked-service
], dialogs: [
  StackedDialog(classType: EditProfileDialog),
// @stacked-dialog
], logger: StackedLogger())
class App {}
