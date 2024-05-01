import 'package:gameslist/dto/platform_dto.dart';
import 'package:gameslist/model/platform.dart';

extension PlatformDtoMapper on PlatformDto {
  Platform toModel() => Platform(name: name, abbreviation: abbreviation);
}
