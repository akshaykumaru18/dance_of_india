library serializers;
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:dance_of_india/logic/serializers/DanceEventModal.dart';
import 'package:dance_of_india/logic/serializers/DanceFormModal.dart';
import 'package:dance_of_india/logic/serializers/HomePageBannerModal.dart';

part 'serializer.g.dart';
/// Collection of generated serializers for the built_value chat example.
@SerializersFor([
  DanceFormModal,
  HomePageBannerModal,
  DanceEventModal
])
final Serializers serializers = _$serializers;