import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lukasz_walencik_flutter_academy_task_zero/models/item_model.dart';

class ItemRepository {
  Stream<List<ItemModel>> getItemsStream() {
    return FirebaseFirestore.instance.collection('data').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map((doc) {
          return ItemModel(
              name: doc['name'],
              info: doc['info'],
              flutter: doc['flutter'],
              snowboard: doc['snowboard']);
        }).toList();
      },
    );
  }
}
