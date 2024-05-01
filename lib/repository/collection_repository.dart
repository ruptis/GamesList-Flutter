import 'package:gameslist/dto/collection_item_dto.dart';
import 'package:gameslist/model/status.dart';

abstract class CollectionRepository {
  Stream<List<CollectionItemDto>> observeCollectionItems(String userId);

  Stream<CollectionItemDto?> observeCollectionItem(
      String userId, String gameId);

  Stream<List<CollectionItemDto>> observeCollectionItemsByStatus(
      String userId, Status status);

  Future<CollectionItemDto?> getCollectionItem(String userId, String gameId);

  Stream<int> observeCollectionItemsCount(String userId);

  Stream<int> observeCollectionItemsCountByStatus(String userId, Status status);

  Future<CollectionItemDto?> addCollectionItem(
      String userId, CollectionItemDto collectionItem);

  Future<CollectionItemDto?> removeCollectionItem(String userId, String gameId);
}
