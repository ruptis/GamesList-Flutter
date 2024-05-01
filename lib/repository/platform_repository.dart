import 'package:gameslist/dto/platform_dto.dart';

abstract class PlatformRepository {
  Stream<List<PlatformDto>> getPlatforms();
}
