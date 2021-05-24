part of 'widgets.dart';

class GridItem extends StatelessWidget {
  final ProductModel productData;

  const GridItem({Key? key, required this.productData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
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
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 8, top: 8),
            child: Row(
              children: [
                Icon(Icons.person_outline),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      productData.merchant,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.only(left: 8, top: 5),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: Container(
                    child: Text(
                      productData.location,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
        ])),
        (productData.isHalal == "1")
            ? Positioned(
                right: 15.0,
                bottom: 30.0,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset("assets/halal.png"),
                ),
              )
            : Container()
      ],
    );
  }
}
