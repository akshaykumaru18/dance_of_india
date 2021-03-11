import 'package:carousel_slider/carousel_slider.dart';
import 'package:dance_of_india/Navigation%20Drawer.dart';
import 'package:dance_of_india/Screens/DanceFormDetailsPage.dart';
import 'package:dance_of_india/Screens/DanceFormsListPage.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:dance_of_india/delegates/SearchDelegate.dart';
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
  static final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

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


          //backgroundColor: themeProvider.darkTheme ? Theme.of(context).primaryColorDark: Theme.of(context).primaryColorLight,
        ),
        drawer: NavigationDrawer(),
        body: CustomScrollView(
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
                        child: Column(
                          children: [
                            CarouselSlider(
                              items: imgList
                                  .map((item) => Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                25,
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.cover,
                                        ),
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgList.map((url) {
                                int index = imgList.indexOf(url);
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: _current == index
                                        ? themeProvider.darkTheme
                                            ? Colors.white
                                            : Colors.black
                                        : themeProvider.darkTheme
                                            ? Colors.white54
                                            : Colors.black26,
                                  ),
                                );
                              }).toList(),
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
                      style: Theme.of(context).textTheme.headline1.copyWith(
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.4,
                              //decoration: BoxDecoration(color: Colors.green),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          danceFormsProvider.danceForms[i].imgList.first),fit: BoxFit.contain)),
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
                                      padding: const EdgeInsets.only(top:3,left: 5.0,right: 5.0),
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
                                      child: Divider(thickness: 2,color: i.isEven
                                          ? Theme.of(context)
                                          .primaryColorDark
                                          : Theme.of(context)
                                          .primaryColorLight),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                      child: Text(
                                        danceFormsProvider.danceForms[i].description,
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
                                      padding: const EdgeInsets.only(top:10.0,left: 5.0,right: 5.0),
                                      child: ElevatedButton(
                                        onPressed: (){
                                              Navigator.push(context, MaterialPageRoute(builder: (_)=> DanceFormDetailsPage(danceFormData: danceFormsProvider.danceForms[i],)));
                                        }, child: Text("View Details"),
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
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (_)=> DanceFormsListPage()));
                    }, child: Text("View More",style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
