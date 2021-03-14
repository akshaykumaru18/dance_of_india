import 'dart:convert';
import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:dance_of_india/logic/serializers/DanceFormModal.dart';
import 'package:dance_of_india/logic/serializers/HomePageBannerModal.dart';
import 'package:flutter/material.dart';

enum DanceFormProviderState { Loading, Ready,Error }

class DanceFormsProvider extends ChangeNotifier {
  List<DanceFormModal> danceForms = new List();
  List<HomePageBannerModal> homePageBanners = new List();

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DanceFormProviderState _danceFormProviderState;

  DanceFormProviderState get danceFormProviderState => _danceFormProviderState;

  set danceFormProviderState(DanceFormProviderState s) {
    _danceFormProviderState = s;
    notifyListeners();
  }

  DanceFormsProvider() {
    loadHomePageBanners();
    loadDanceForms();

  }


  void loadHomePageBanners() async{
   /// danceFormProviderState = DanceFormProviderState.Loading;
    await _firestore.collection('/Homepage-Banners').get().then((value) {
      if(value.docs.isNotEmpty){
        value.docs.forEach((doc) {
          HomePageBannerModal data = new HomePageBannerModal((b) => b..imgLink = doc["imgLink"]
              ..bannerText = doc["bannerText"]
              ..routePage = doc["routePage"]
          );

          if(!homePageBanners.contains(data)){
            homePageBanners.add(data);
          }
        });
      }
    }).catchError((e)=> print('Error loading /Homepage-Banners $e'));
    notifyListeners();
    //danceFormProviderState = DanceFormProviderState.Ready;
  }
  void loadDanceForms() async {
    danceFormProviderState = DanceFormProviderState.Loading;
    await _firestore.collection('/Dance-Forms').get().then((value) {
      if(value.docs.isNotEmpty){
        value.docs.forEach((doc) {
          DanceFormModal danceData = new DanceFormModal((b) => b
            ..poster = doc["poster"]

            ..danceName = doc["danceName"]
            ..origin = doc["origin"]
            ..description = doc["description"]
            ..infoParagraph1 =
            doc["infoParagraph1"]
            ..infoParagraph2 =
            doc["infoParagraph2"]
            ..wikiLink = doc["wikiLink"]
            ..imgList = new BuiltList<String>.from(doc["imgList"]).toBuiltList().toBuilder());

          if(!danceForms.contains(danceData)){
            danceForms.add(danceData);
          }
        });
      }
    }).catchError((e)=> print('Error loading dance forms $e'));

    danceFormProviderState = DanceFormProviderState.Ready;



    //print(danceForms);
  }
}
