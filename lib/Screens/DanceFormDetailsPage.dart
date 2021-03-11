import 'package:carousel_slider/carousel_slider.dart';
import 'package:dance_of_india/Navigation%20Drawer.dart';
import 'package:dance_of_india/Screens/DanceFormsListPage.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:dance_of_india/logic/serializers/DanceFormModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DanceFormDetailsPage extends StatefulWidget {
  DanceFormDetailsPage({this.danceFormData});

  final DanceFormModal danceFormData;

  @override
  _DanceFormDetailsPageState createState() => _DanceFormDetailsPageState();
}

class _DanceFormDetailsPageState extends State<DanceFormDetailsPage> {

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,

        //backgroundColor: themeProvider.darkTheme ? Theme.of(context).primaryColorDark: Theme.of(context).primaryColorLight,
      ),
      drawer: NavigationDrawer(),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: themeProvider.darkTheme
                      ? Theme.of(context).primaryColorDark
                      : Theme.of(context).primaryColorLight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      ShaderMask(
                        shaderCallback: (rect) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Colors.black.withOpacity(1.0),
                              Colors.black.withOpacity(1.0),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withAlpha(2),
                            ],
                            stops: [0.0, 0.4, 0.6, 1.0],
                          ).createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                        },
                        blendMode: BlendMode.dstIn,
                        child: Center(
                          child: Image.network(
                            widget.danceFormData.poster,
                            fit: BoxFit.contain,
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 30,
                          left: 10,
                          right: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            height: MediaQuery.of(context).size.height * 0.15,
                            child: Center(child: Text(widget.danceFormData.danceName,style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 40,fontFamily: "Redressed",letterSpacing: 1.5),)),
                          )),
                    ],
                  ),
                  Container(

                    width: MediaQuery.of(context).size.width * 0.95,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(child: Divider(thickness: 4,)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("•••••",style: Theme.of(context).textTheme.headline1,),
                              ),
                              Expanded(child: Divider(thickness: 4,))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Origin : ${widget.danceFormData.origin}",
                            style: Theme.of(context)
                                .textTheme
                                .headline1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Gallery",
                            style: Theme.of(context)
                                .textTheme
                                .headline1,
                            textAlign: TextAlign.center,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Center(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: themeProvider.darkTheme
                                        ? Theme.of(context).primaryColorDark
                                        : Theme.of(context).primaryColorLight,
                                    borderRadius: BorderRadius.circular(5)),

                                child: Container(
                                  child: Column(
                                    children: [
                                      CarouselSlider(
                                        items: widget.danceFormData.imgList
                                            .map((item) => Container(
                                          width:
                                          MediaQuery.of(context).size.width *
                                              1,
                                          height:
                                          MediaQuery.of(context).size.height *
                                              25,
                                          child: Image.network(
                                            item,
                                            fit: BoxFit.contain,
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
                                        children: widget.danceFormData.imgList.map((url) {
                                          int index = widget.danceFormData.imgList.indexOf(url);
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Description : ",
                            style: Theme.of(context)
                                .textTheme
                                .headline1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.danceFormData.description,
                            style: Theme.of(context)
                                .textTheme
                                .headline6.copyWith(fontSize: 20,letterSpacing: 1),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.danceFormData.infoParagraph1,
                            style: Theme.of(context)
                                .textTheme
                                .headline6.copyWith(fontSize: 20,letterSpacing: 1),
                            textAlign: TextAlign.left,
                          ),

                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.danceFormData.infoParagraph2,
                            style: Theme.of(context)
                                .textTheme
                                .headline6.copyWith(fontSize: 20,letterSpacing: 1),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Expanded(child: Divider(thickness: 4,)),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("•••••",style: Theme.of(context).textTheme.headline1,),
                              ),
                              Expanded(child: Divider(thickness: 4,))
                            ],
                          ),
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                    onPressed: () async{
                      await canLaunch(widget.danceFormData.wikiLink) ? await launch(widget.danceFormData.wikiLink) : throw 'Could not launch ${widget.danceFormData.wikiLink}';
                    }, child: Text("Go to Wiki",style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white,fontSize: 20),),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
