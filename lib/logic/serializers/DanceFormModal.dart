import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dance_of_india/logic/serializers/serializer.dart';

part 'DanceFormModal.g.dart';

abstract class DanceFormModal implements Built<DanceFormModal, DanceFormModalBuilder> {


  String get danceName;
  String get origin;
  String get description;
  String get infoParagraph1;
  String get infoParagraph2;
  String get wikiLink;
  BuiltList<String> get imgList;


  DanceFormModal._();
  factory DanceFormModal([void Function(DanceFormModalBuilder) updates]) = _$DanceFormModal;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(DanceFormModal.serializer, this);
  }

  static DanceFormModal fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DanceFormModal.serializer, json);
  }

  static Serializer<DanceFormModal> get serializer => _$danceFormModalSerializer;
}