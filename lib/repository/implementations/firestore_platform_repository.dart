import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gameslist/dto/platform_dto.dart';
import 'package:gameslist/repository/platform_repository.dart';

class FirestorePlatformRepository implements PlatformRepository {
  final CollectionReference _platformsCollection =
      FirebaseFirestore.instance.collection('platforms');

  @override
  Stream<List<PlatformDto>> getPlatforms() =>
      _platformsCollection.snapshots().map((snapshot) => snapshot.docs
          .map((doc) =>
              PlatformDto.fromJson(doc.data() as Map<String, dynamic>, doc.id))
          .toList());
}
