part of 'screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String defaultTitle = "httpRequest";
  List<ProductModel>? resultBody;

  /// start network request
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
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
        appBar: AppBar(
          title: Text(defaultTitle),
        ),
        body: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: resultBody!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (itemWidth / itemHeight), crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return GridItem(
                productData: resultBody![index],
              );
            }));
  }
}
