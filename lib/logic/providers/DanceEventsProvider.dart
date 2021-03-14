import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dance_of_india/logic/serializers/DanceEventModal.dart';
import 'package:flutter/material.dart';

enum EventSectionState { Ready, Loading }

class DanceEventsProvider extends ChangeNotifier {
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference eventCollectionRef = _firestore.collection('/Events');
  StreamSubscription eventCollectionSub;
  List<DanceEventModal> eventsList = new List();
  EventSectionState _eventSectionState;

  EventSectionState get eventSectionState => _eventSectionState;

  set eventSectionState(EventSectionState e) {
    _eventSectionState = e;
    notifyListeners();
  }

  DanceEventsProvider() {

    loadEvents();
  }

  void listenForEvent(){
    eventCollectionSub = eventCollectionRef.snapshots().listen((value) {
      if (value.docs.length > 0) {
        value.docs.forEach((doc) {
          Timestamp timeStamp = doc['date'];
          DateTime eventDateTime = timeStamp.toDate();

          DanceEventModal eventModal = DanceEventModal((b) => b
            ..title = doc["title"]
            ..description = doc["description"]
            ..date = eventDateTime
            ..posterImg = doc["posterImg"]
            ..venue = doc["venue"]
            ..address = doc["address"]
            ..city = doc["city"]
            ..state = doc["state"]
            ..pinCode = doc["pinCode"]
            ..country = doc["country"]
            ..isPaid = doc["isPaid"]
            ..ticketPrice = int.parse(doc["ticketPrice"])
          );

          if(!eventsList.contains(eventModal)){
            eventsList.add(eventModal);
          }
        });
      }
    });

  }
  void loadEvents() async {
    eventSectionState = EventSectionState.Loading;
    await eventCollectionRef.get().then((value) {
      if (value.docs.length > 0) {
        value.docs.forEach((doc) {
          print('Event doc ${doc.data()}');
          Timestamp timeStamp = doc['date'];
          DateTime eventDateTime = timeStamp.toDate();

          DanceEventModal eventModal = DanceEventModal((b) => b
            ..title = doc["title"]
            ..description = doc["description"]
            ..date = eventDateTime
            ..posterImg = doc["posterImg"]
            ..venue = doc["venue"]
            ..address = doc["address"]
            ..city = doc["city"]
            ..state = doc["state"]
            ..pinCode = doc["pinCode"]
            ..country = doc["country"]
            ..isPaid = doc["isPaid"]
            ..ticketPrice = int.parse(doc["ticketPrice"])
          );

          if(!eventsList.contains(eventModal)){
            eventsList.add(eventModal);
            print('Event is $eventModal');
          }
        });
        listenForEvent();
      }
    }).catchError((e) {
      print('Error : Failed loading events $e');
    });
    eventSectionState = EventSectionState.Ready;
  }

  void dispose(){
    eventCollectionSub.cancel();
  }
}
