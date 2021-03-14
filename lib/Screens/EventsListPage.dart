import 'package:dance_of_india/Screens/DanceFormDetailsPage.dart';
import 'package:dance_of_india/Screens/EventDetailsPage.dart';
import 'package:dance_of_india/Utils/ThemeProvider.dart';
import 'package:dance_of_india/logic/providers/DanceEventsProvider.dart';
import 'file:///C:/Users/Akshay%20Kumar%20U/AndroidStudioProjects/dance_of_india/lib/logic/providers/DanceFormsProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsListPage extends StatefulWidget {
  @override
  _EventsListPageState createState() => _EventsListPageState();
}

class _EventsListPageState extends State<EventsListPage> {
  String month(int month) {
    switch (month) {
      case 1:
        return "Jan";
      case 2:
        return "Feb";
      case 3:
        return "Mar";
      case 4:
        return "Apr";
      case 5:
        return "May";
      case 6:
        return "Jun";
      case 7:
        return "Jul";
      case 8:
        return "Aug";
      case 9:
        return "Sep";
      case 10:
        return "Oct";
      case 11:
        return "Nov";
      case 12:
        return "Dec";
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final danceEventsProvider = Provider.of<DanceEventsProvider>(context);
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 1,
                            color: themeProvider.darkTheme
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColorDark)),
                    child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(30)
                        // ),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(
                                  "Search",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(fontSize: 22),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Icon(Icons.search,
                                    size: 30,
                                    color: themeProvider.darkTheme
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Events : ",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((BuildContext context, int i) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>EventDetailsPage(event: danceEventsProvider
                      .eventsList[i],)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: themeProvider.darkTheme
                                ? Theme.of(context).primaryColorLight
                                : Theme.of(context).primaryColorDark)),
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.29,
                            //decoration: BoxDecoration(color: Colors.green),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(danceEventsProvider
                                        .eventsList[i].posterImg),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        // Divider(
                        //   color: themeProvider.darkTheme
                        //       ? Theme.of(context).primaryColorLight
                        //       : Theme.of(context).primaryColorDark,
                        //   thickness: 1,
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10.0, left: 5.0, right: 5.0),
                                    child: Text(
                                      danceEventsProvider.eventsList[i].title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline1
                                          .copyWith(
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w700),
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5.0, left: 5.0, right: 5.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.location_on),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  0.01,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0),
                                          child: Text(
                                            danceEventsProvider
                                                .eventsList[i].venue,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .copyWith(
                                                    decoration:
                                                        TextDecoration.underline,
                                                    height: 1),
                                            maxLines: 1,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  height:
                                      MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.redAccent),
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "${danceEventsProvider.eventsList[i].date.day}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  fontWeight: FontWeight.w900,
                                                  letterSpacing: 0),
                                        ),
                                        Text(
                                          "${month(danceEventsProvider.eventsList[i].date.month)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              .copyWith(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .primaryColorLight,
                                                  fontWeight: FontWeight.w900),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, childCount: danceEventsProvider.eventsList.length),
            itemExtent: 330),
        //MediaQuery.of(context).size.height * 0.45
      ],
    ));
  }
}
