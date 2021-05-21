part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text(defaultTitle),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: resultBody != null ? resultBody!.length : 0,
          itemBuilder: (BuildContext context, int index) {
            return ListItem(
              title: "Product ${resultBody![index].title}",
            );
          }),
    );
  }
}
