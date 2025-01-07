// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_club_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListClubModel _$ListClubModelFromJson(Map<String, dynamic> json) =>
    ListClubModel(
      (json['teams'] as List<dynamic>?)
          ?.map((e) => ItemClubModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListClubModelToJson(ListClubModel instance) =>
    <String, dynamic>{
      'teams': instance.teams,
    };
