import 'package:json_annotation/json_annotation.dart';

part 'dummy_item_model.g.dart';

@JsonSerializable()
class DummyItemModel {
  final String? idMeal;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strMeal;

  DummyItemModel(this.idMeal, this.strCategory, this.strArea,
      this.strInstructions, this.strMealThumb, this.strMeal);

  factory DummyItemModel.fromJson(Map<String, dynamic> json) =>
      _$DummyItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$DummyItemModelToJson(this);
}
