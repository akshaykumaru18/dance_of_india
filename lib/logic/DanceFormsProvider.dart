import 'dart:convert';
import 'package:built_collection/built_collection.dart';

import 'package:dance_of_india/logic/serializers/DanceFormModal.dart';
import 'package:flutter/material.dart';

class DanceFormsProvider extends ChangeNotifier {
  List<DanceFormModal> danceForms = new List();

  DanceFormsProvider() {
    addMockData();
  }


  void addMockData() {
    print("hola");
    var imgData = {
      "images":[
        "https://64.media.tumblr.com/9eed6f8d0509407af144d88652fb8d11/tumblr_p3cxug9zkQ1wtg8hyo1_1280.png",
      ]
    };

    BuiltList danceImageList =
    new BuiltList<String>.from(imgData["images"]).toBuiltList();

    DanceFormModal bharathaNatyam = new DanceFormModal((b) => b
      ..danceName = "Bharatanatyam"
      ..origin = "Tamil nadu"
      ..description =
          "Bharatanatyam is one of the oldest classical dance traditions in India."
      ..infoParagraph1 =
          "It has been nurtured in the temples and courts of southern India since the ancient era."
      ..infoParagraph2 =
          "Bharatanatyam is traditionally a team performance art that consists of a solo dancer, accompanied by musicians and one or more singers."
              " The theory behind the musical notes, vocal performance and the dance movement trace back to the ancient Natya Shastra, and many Sanskrit and Tamil texts such as the Abhinaya Darpana"
      ..wikiLink = "https://en.wikipedia.org/wiki/Bharatanatyam"
      ..imgList = danceImageList.toBuilder());


    DanceFormModal yakshagana = new DanceFormModal((b) => b
      ..danceName = "Yakshagana"
      ..origin = "Karnataka"
      ..description =
          "yakshagana is performed in the open air by troupes. "
      ..infoParagraph1 =
          "With roots in Sanskrit literature and theatre, yakshagana emerged as a form of dance-drama in the 16th century. During the following 500 years, the yakshagana corpus grew to include hundreds of plays"
      ..infoParagraph2 =
          "Yakshagana, dance-drama of South India, associated most strongly with the state of Karnataka. Elaborate and colourful costumes, makeup, and masks constitute some of the most-striking features of the art form"
          " The theory behind the musical notes, vocal performance and the dance movement trace back to the ancient Natya Shastra, and many Sanskrit and Tamil texts such as the Abhinaya Darpana"
      ..wikiLink = "https://en.wikipedia.org/wiki/Yakshagana"
      ..imgList = new BuiltList<String>.from(["https://mir-s3-cdn-cf.behance.net/project_modules/fs/94554961247671.5a6857be809dc.png"]).toBuiltList().toBuilder());

    danceForms.add(yakshagana);
    danceForms.add(bharathaNatyam);
    //print(danceForms);
  }
}
