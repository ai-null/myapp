import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:myapp/model/ProductModel.dart';
import 'package:myapp/network/Network.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String defaultTitle = "httpRequest";
  List<ProductModel>? resultBody;

  void startRequest() async {
    List<ProductModel>? data = await Network.getProduct();

    setState(() {
      resultBody = data;
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
      title: defaultTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(defaultTitle),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: resultBody != null ? resultBody!.length : 0,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text("Product ${resultBody![index].title}"),
              );
            }),
      ),
    );
  }
}
