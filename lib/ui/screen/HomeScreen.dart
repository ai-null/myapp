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

    // update state
    setState(() {
      resultBody = data;
    });
  }

  @override
  void initState() {
    super.initState();
    startRequest();
  }

  /// check whether resultBody is null or not pass to the [GridView.count]
  /// @return [int]
  int isResultNull() {
    return (resultBody != null && resultBody!.isNotEmpty)
        ? resultBody!.length
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    // measure aspect ratio
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    final double aspectRatio = (itemWidth / itemHeight);

    return Scaffold(
        appBar: AppBar(
          title: Text(defaultTitle),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
              tooltip: "Shopping cart",
            )
          ],
        ),
        body: GridView.builder(
            padding: const EdgeInsets.all(8),
            shrinkWrap: true,
            itemCount: isResultNull(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: aspectRatio, crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return GridItem(
                productData: resultBody![index],
              );
            }));
  }
}
