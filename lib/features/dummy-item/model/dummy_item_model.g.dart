// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dummy_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DummyItemModel _$DummyItemModelFromJson(Map<String, dynamic> json) =>
    DummyItemModel(
      json['idMeal'] as String?,
      json['strCategory'] as String?,
      json['strArea'] as String?,
      json['strInstructions'] as String?,
      json['strMealThumb'] as String?,
      json['strMeal'] as String?,
    );

Map<String, dynamic> _$DummyItemModelToJson(DummyItemModel instance) =>
    <String, dynamic>{
      'idMeal': instance.idMeal,
      'strCategory': instance.strCategory,
      'strArea': instance.strArea,
      'strInstructions': instance.strInstructions,
      'strMealThumb': instance.strMealThumb,
      'strMeal': instance.strMeal,
    };
