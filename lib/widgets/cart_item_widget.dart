import 'package:amazon_clone/modal/product_model.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/widgets/custom_square_button.dart';
import 'package:amazon_clone/widgets/product_information_widget.dart';
import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final ProductModel product;
  const CartItemWidget({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    var space = EdgeInsets.only(right: 5);
    return Container(
      padding: EdgeInsets.all(25),
      height: screenSize.height / 2,
      width: screenSize.width,
      decoration: const BoxDecoration(
        color: backgroundColor,
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              //   mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenSize.width / 3,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.network(product.url),
                  ),
                ),
                ProductInformationWidget(
                  productName: product.productName,
                  cost: product.cost,
                  sellerName: product.sellerName,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                CustomSquareButton(
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 35,
                    child: const Icon(Icons.remove)),
                Padding(padding: space),
                CustomSquareButton(
                    onPressed: () {},
                    color: Colors.white,
                    dimension: 35,
                    child: const Text(
                      "0",
                      style: TextStyle(color: activeCyanColor),
                    )),
                Padding(padding: space),
                CustomSquareButton(
                    onPressed: () {},
                    color: backgroundColor,
                    dimension: 35,
                    child: const Icon(Icons.add)),
              ],
            ),
            flex: 1,
          ),
          Expanded(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  CustomSimpleRoundedButton(onPressed: () {}, text: "Delete"),
                  SizedBox(width: 7),
                  CustomSimpleRoundedButton(
                      onPressed: () {}, text: "save for later")
                ],
              ),
              SizedBox(height: 9),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "See more of this",
                  style: TextStyle(color: activeCyanColor),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
