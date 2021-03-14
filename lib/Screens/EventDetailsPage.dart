import 'package:dance_of_india/Navigation%20Drawer.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:dance_of_india/logic/serializers/DanceEventModal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsPage extends StatefulWidget {
  EventDetailsPage({this.event});

  final DanceEventModal event;

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
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
                              widget.event.posterImg,
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width * 1,
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
                              child: Center(
                                  child: Text(
                                widget.event.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        fontSize: 40,
                                        fontFamily: "Redressed",
                                        letterSpacing: 1.5),
                              )),
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
                                Expanded(
                                    child: Divider(
                                  thickness: 2,
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "•••••",
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 2,
                                ))
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Address : ",
                              style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.01,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Text(
                                        "${widget.event.venue} ${widget.event.address}, ${widget.event.city} ${widget.event.state}, ${widget.event.pinCode}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6.copyWith(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Description : ",
                              style: Theme.of(context).textTheme.headline1.copyWith(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.event.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(fontSize: 16, letterSpacing: 1),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  thickness: 2,
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "•••••",
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 2,
                                ))
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
          ],
        ),
        floatingActionButton:Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            width: MediaQuery.of(context).size.width * 0.6,
            child: ElevatedButton(
              onPressed: () async {},
              child: Text(
                "Book Ticket",
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .copyWith(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
        ));
  }
}
