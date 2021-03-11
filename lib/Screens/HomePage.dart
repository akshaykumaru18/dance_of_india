import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dance_of_india/Navigation%20Drawer.dart';
import 'package:dance_of_india/Screens/DanceFormDetailsPage.dart';
import 'package:dance_of_india/Screens/DanceFormsListPage.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';

import 'package:dance_of_india/logic/DanceFormsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final danceFormsProvider = Provider.of<DanceFormsProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.headline1,
          ),
          centerTitle: true,
        ),
        drawer: NavigationDrawer(),
        body: danceFormsProvider.danceFormProviderState ==
                DanceFormProviderState.Loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Center(
                        child: Container(
                            decoration: BoxDecoration(
                                color: themeProvider.darkTheme
                                    ? Theme.of(context).primaryColorDark
                                    : Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.circular(5)),
                            // height: MediaQuery
                            //     .of(context)
                            //     .size
                            //     .height * 0.32,
                            child: Container(
                              child: Stack(
                                children: [
                                  CarouselSlider(
                                    items: danceFormsProvider.homePageBanners
                                        .map((item) => Stack(
                                              children: [
                                                Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      1,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      3,
                                                  child: Image.network(
                                                    item.imgLink,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: 20,
                                                    left: 1,
                                                    right: 1,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Container(
                                                        width: MediaQuery.of(context).size.width * 0.5,
                                                        height: MediaQuery.of(context).size.height * 0.06,
                                                        decoration: BoxDecoration(
                                                            shape: BoxShape.rectangle, // BoxShape.circle or BoxShape.retangle
                                                            //color: const Color(0xFF66BB6A),
                                                            boxShadow: [BoxShadow(
                                                              color: Colors.black54,
                                                              blurRadius: 7.0,
                                                            ),]
                                                        ),
                                                        child: Center(child: Text(item.bannerText,style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white,fontFamily: "Redressed",letterSpacing: 2,fontSize: 30),)),
                                                      ),
                                                    ))
                                              ],
                                            ))
                                        .toList(),
                                    options: CarouselOptions(
                                        viewportFraction: 1,
                                        autoPlay: true,
                                        // enlargeCenterPage: true,
                                        aspectRatio: 16 / 9,
                                        autoPlayInterval: Duration(seconds: 5),
                                        //aspectRatio: 2.0,
                                        onPageChanged: (index, reason) {
                                          setState(() {
                                            _current = index;
                                          });
                                        }),
                                  ),
                                  Positioned(
                                    bottom: 1,
                                    left: 1,
                                    right: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: danceFormsProvider
                                          .homePageBanners
                                          .map((url) {
                                        int index = danceFormsProvider
                                            .homePageBanners
                                            .indexOf(url);
                                        return Container(
                                          width: 8.0,
                                          height: 8.0,
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10.0, horizontal: 2.0),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _current == index
                                                ? Colors.white
                                                : themeProvider.darkTheme
                                                    ? Colors.white70
                                                    : Colors.black45,
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Card(
                        elevation: 0.0,
                        child: Center(
                          child: Text(
                            "\" Let your soul embrace the\n art of dance \"",
                            style:
                                Theme.of(context).textTheme.headline1.copyWith(
                                      fontFamily: "Allura",
                                      fontSize: 30,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Explore",
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                  ),
                  SliverFixedExtentList(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int i) {
                        return Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                                color: i.isEven
                                    ? Theme.of(context).primaryColorLight
                                    : Theme.of(context).primaryColorDark),
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 1,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    //decoration: BoxDecoration(color: Colors.green),
                                    decoration: BoxDecoration(
                                        color: i.isEven
                                            ? Theme.of(context)
                                                .primaryColorLight
                                            : Theme.of(context)
                                                .primaryColorDark,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                danceFormsProvider
                                                    .danceForms[i].poster),
                                            fit: BoxFit.contain)),
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0,
                                                left: 5.0,
                                                right: 5.0),
                                            child: Text(
                                              danceFormsProvider
                                                  .danceForms[i].danceName,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1
                                                  .copyWith(
                                                      color: i.isEven
                                                          ? Theme.of(context)
                                                              .primaryColorDark
                                                          : Theme.of(context)
                                                              .primaryColorLight),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 3, left: 5.0, right: 5.0),
                                            child: Text(
                                              "Place : ${danceFormsProvider.danceForms[i].origin}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .copyWith(
                                                      color: i.isEven
                                                          ? Theme.of(context)
                                                              .primaryColorDark
                                                          : Theme.of(context)
                                                              .primaryColorLight),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Divider(
                                                thickness: 2,
                                                color: i.isEven
                                                    ? Theme.of(context)
                                                        .primaryColorDark
                                                    : Theme.of(context)
                                                        .primaryColorLight),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0, right: 5.0),
                                            child: Text(
                                              danceFormsProvider
                                                  .danceForms[i].description,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6
                                                  .copyWith(
                                                      color: i.isEven
                                                          ? Theme.of(context)
                                                              .primaryColorDark
                                                          : Theme.of(context)
                                                              .primaryColorLight),
                                              textAlign: TextAlign.justify,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10.0,
                                                left: 5.0,
                                                right: 5.0),
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            DanceFormDetailsPage(
                                                              danceFormData:
                                                                  danceFormsProvider
                                                                      .danceForms[i],
                                                            )));
                                              },
                                              child: Text("View Details"),
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
                      itemExtent: MediaQuery.of(context).size.height * 0.3),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => DanceFormsListPage()));
                          },
                          child: Text(
                            "View More",
                            style: Theme.of(context)
                                .textTheme
                                .headline1
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ));
  }
}
