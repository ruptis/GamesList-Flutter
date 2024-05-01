import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gameslist/dto/collection_item_dto.dart';
import 'package:gameslist/model/status.dart';
import 'package:gameslist/repository/collection_repository.dart';

class FirestoreCollectionRepository implements CollectionRepository {
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection("users");

  @override
  Future<CollectionItemDto?> addCollectionItem(
      String userId, CollectionItemDto collectionItem) async {
    await _getCollectionReference(userId)
        .doc(collectionItem.gameId)
        .set(collectionItem.toJson());
    return collectionItem;
  }

  @override
  Future<CollectionItemDto?> getCollectionItem(String userId, String gameId) =>
      _getCollectionReference(userId).doc(gameId).get().then((snapshot) {
        if (snapshot.exists) {
          return CollectionItemDto.fromJson(
              snapshot.data() as Map<String, dynamic>, snapshot.id);
        } else {
          return null;
        }
      });

  @override
  Stream<List<CollectionItemDto>> observeCollectionItems(String userId) =>
      _getCollectionReference(userId).snapshots().map((snapshot) => snapshot
          .docs
          .map((doc) => CollectionItemDto.fromJson(
              doc.data() as Map<String, dynamic>, doc.id))
          .toList());

  @override
  Stream<CollectionItemDto?> observeCollectionItem(
          String userId, String gameId) =>
      _getCollectionReference(userId).doc(gameId).snapshots().map((snapshot) {
        if (snapshot.exists) {
          return CollectionItemDto.fromJson(
              snapshot.data() as Map<String, dynamic>, snapshot.id);
        } else {
          return null;
        }
      });

  @override
  Stream<List<CollectionItemDto>> observeCollectionItemsByStatus(
          String userId, Status status) =>
      _getCollectionReference(userId)
          .where("status", isEqualTo: status.value)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => CollectionItemDto.fromJson(
                  doc.data() as Map<String, dynamic>, doc.id))
              .toList());

  @override
  Stream<int> observeCollectionItemsCount(String userId) =>
      _getCollectionReference(userId)
          .snapshots()
          .map((snapshot) => snapshot.docs.length);

  @override
  Stream<int> observeCollectionItemsCountByStatus(
          String userId, Status status) =>
      _getCollectionReference(userId)
          .where("status", isEqualTo: status.value)
          .snapshots()
          .map((snapshot) => snapshot.docs.length);

  @override
  Future<CollectionItemDto?> removeCollectionItem(
          String userId, String gameId) =>
      _getCollectionReference(userId).doc(gameId).get().then((snapshot) {
        if (snapshot.exists) {
          final collectionItem = CollectionItemDto.fromJson(
              snapshot.data() as Map<String, dynamic>, snapshot.id);
          snapshot.reference.delete();
          return collectionItem;
        } else {
          return null;
        }
      });

  CollectionReference _getCollectionReference(String userId) =>
      _usersCollection.doc(userId).collection("games-collection");
}
