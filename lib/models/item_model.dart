// import 'package:freezed_annotation/freezed_annotation.dart';
// part 'item_model.freezed.dart';

// @freezed
// class ItemModel with _$ItemModel {
//   factory ItemModel(
//     String name,
//     String info,
//     String flutter,
//     String snowboard,
//   ) = _ItemModel;
//   factory ItemModel.fromJson(Map<String, dynamic> json) =>
//       _$ItemModelFromJson(json);
// }

class ItemModel {
  ItemModel(
      {required this.name,
      required this.info,
      required this.flutter,
      required this.snowboard});

  final String name;
  final String info;
  final String flutter;
  final String snowboard;
}
