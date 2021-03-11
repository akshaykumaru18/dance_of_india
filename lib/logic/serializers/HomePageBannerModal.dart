import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:dance_of_india/logic/serializers/serializer.dart';

part 'HomePageBannerModal.g.dart';

abstract class HomePageBannerModal implements Built<HomePageBannerModal, HomePageBannerModalBuilder> {
  String get imgLink;
  String get routePage;
  String get bannerText;

  HomePageBannerModal._();
  factory HomePageBannerModal([void Function(HomePageBannerModalBuilder) updates]) = _$HomePageBannerModal;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(HomePageBannerModal.serializer, this);
  }

  static HomePageBannerModal fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(HomePageBannerModal.serializer, json);
  }

  static Serializer<HomePageBannerModal> get serializer => _$homePageBannerModalSerializer;
}