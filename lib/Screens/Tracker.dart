import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  const TrackerPage({Key? key}) : super(key: key);

  @override
  State<TrackerPage> createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Track Order"),
      ),
      body: Text("Tracker Page"),
    );
  }
}
