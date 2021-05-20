import 'package:flutter/material.dart';
import 'package:myapp/network/Network.dart';

void main() {
  runApp(MyApp(title: "Http request"));
}

class MyApp extends StatefulWidget {
  final String title;
  const MyApp({Key? key, required this.title}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String? resultBody;

  void startRequest() async {
    String? data = await Network.getProduct();

    setState(() {
      resultBody = data.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    startRequest();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: widget.title,
      home: Scaffold(
        appBar: AppBar(title: Text(widget.title),),
        body: Center(
          child: Text(resultBody != null ? resultBody! : "Loading data.."),
        ),
      ),
    );
  }
}

