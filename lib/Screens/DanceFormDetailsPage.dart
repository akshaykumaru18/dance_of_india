import 'package:dance_of_india/logic/serializers/DanceFormModal.dart';
import 'package:flutter/material.dart';
class DanceFormDetailsPage extends StatelessWidget {
  DanceFormDetailsPage({this.danceFormData});
  final DanceFormModal danceFormData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          danceFormData.danceName,
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,


        //backgroundColor: themeProvider.darkTheme ? Theme.of(context).primaryColorDark: Theme.of(context).primaryColorLight,
      ),
    );
  }
}
