import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dance_of_india/logic/serializers/serializer.dart';

part 'DanceEventModal.g.dart';

abstract class DanceEventModal implements Built<DanceEventModal, DanceEventModalBuilder> {


  String get title;
  String get description;

  DateTime get date;
  String get posterImg;
  String get venue;
  String get address;
  String get city;
  String get state;
  String get pinCode;
  String get country;
  bool get isPaid;
  int get ticketPrice;
  DanceEventModal._();
  factory DanceEventModal([void Function(DanceEventModalBuilder) updates]) = _$DanceEventModal;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(DanceEventModal.serializer, this);
  }

  static DanceEventModal fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(DanceEventModal.serializer, json);
  }

  static Serializer<DanceEventModal> get serializer => _$danceEventModalSerializer;
}