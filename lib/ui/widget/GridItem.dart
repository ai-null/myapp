part of 'widgets.dart';

class GridItem extends StatelessWidget {
  final ProductModel productData;

  const GridItem({Key? key, required this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Container(
                height: 140,
                width: MediaQuery.of(context).size.width,
                child: (productData.photo == "")
                    ? Image.asset(
                        Constants.BROKEN_IMAGE_PATH,
                        fit: BoxFit.cover,
                      )
                    : Image.network(
                        Constants.BASE_IMAGE_URL + productData.photo,
                        fit: BoxFit.cover,
                      )),
          ),
          ListTile(title: Text(productData.title)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton(
              child: const Text('ADD TO CHART'),
              onPressed: () {
                /* ... */
              },
            ),
            const SizedBox(width: 8),
          ])
    ]));
  }
}
