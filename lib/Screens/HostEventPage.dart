import 'package:flutter/material.dart';

class HostEventPage extends StatefulWidget {
  @override
  _HostEventPageState createState() => _HostEventPageState();
}

class _HostEventPageState extends State<HostEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Host",
          style: Theme.of(context).textTheme.headline1,
        ),
        centerTitle: true,

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
