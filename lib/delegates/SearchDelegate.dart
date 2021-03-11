import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//DOI => Dance of India
class DOISearchDelegate extends SearchDelegate{

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    //final themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme;
  }
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){})
    ];
    //throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
      Navigator.pop(context);
    });
    //throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Center(
      child: FlutterLogo(),
    );
    //throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(
      child: FlutterLogo(),
    );
   // throw UnimplementedError();
  }

}