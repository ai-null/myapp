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
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 8),
            child: Text(
              productData.title,
              style: indigoTextFont,
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 2),
            child: Text(
              NumberFormat.currency(
                      locale: "id_ID", decimalDigits: 0, symbol: "Rp.")
                  .format(productData.price),
              style: orangeTextFont,
            ),
            alignment: Alignment.centerLeft,
          ),
          Row(children: <Widget>[
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
