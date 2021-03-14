import 'package:dance_of_india/Navigation%20Drawer.dart';
import 'package:dance_of_india/Screens/DanceFormDetailsPage.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:dance_of_india/delegates/SearchDelegate.dart';
import 'file:///C:/Users/Akshay%20Kumar%20U/AndroidStudioProjects/dance_of_india/lib/logic/providers/DanceFormsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DanceFormsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final danceFormsProvider = Provider.of<DanceFormsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Explore",
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                onPressed: () {
                  showSearch(context: context, delegate: DOISearchDelegate());
                })
          ],

          //backgroundColor: themeProvider.darkTheme ? Theme.of(context).primaryColorDark: Theme.of(context).primaryColorLight,
        ),
        drawer: NavigationDrawer(),
        body: CustomScrollView(
          slivers: [
            SliverFixedExtentList(
                delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int i) {
                      return Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 1,
                          // decoration: BoxDecoration(
                          //     color: themeProvider.darkTheme
                          //         ? Theme.of(context).primaryColorDark
                          //         : Theme.of(context).primaryColorLight),
                          alignment: Alignment.center,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  //decoration: BoxDecoration(color: Colors.green),
                                  decoration: BoxDecoration(
                                      color: themeProvider.darkTheme
                                          ? Theme.of(context).primaryColorDark
                                          : Theme.of(context).primaryColorLight,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              danceFormsProvider.danceForms[i].poster),fit: BoxFit.contain)),
                                ),
                                Expanded(
                                    child: Container(
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top:20.0,left: 5.0,right: 5.0),
                                              child: Text(
                                                danceFormsProvider.danceForms[i].danceName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline1,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top:3,left: 5.0,right: 5.0),
                                              child: Text(
                                                "Place : ${danceFormsProvider.danceForms[i].origin}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            // Padding(
                                            //   padding: const EdgeInsets.all(5.0),
                                            //   child: Divider(thickness: 2,color: themeProvider.darkTheme
                                            //       ? Theme.of(context)
                                            //       .primaryColorLight
                                            //       : Theme.of(context)
                                            //       .primaryColorDark),
                                            // ),
                                            Padding(
                                              padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
                                              child: Text(
                                                danceFormsProvider.danceForms[i].description,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline6,
                                                textAlign: TextAlign.justify,
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
                                              child: ElevatedButton(
                                                onPressed: (){
                                                  Navigator.push(context, MaterialPageRoute(builder: (_)=> DanceFormDetailsPage(danceFormData: danceFormsProvider.danceForms[i],)));
                                                }, child: Text("View Details",style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.white),),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }, childCount: danceFormsProvider.danceForms.length),
                itemExtent: 220),

          ],
        ));
  }
}
