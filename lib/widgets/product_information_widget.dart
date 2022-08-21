import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:flutter/material.dart';

class ProductInformationWidget extends StatelessWidget {
  final String productName;
  final double cost;
  final String sellerName;
  const ProductInformationWidget(
      {Key? key,
      required this.productName,
      required this.cost,
      required this.sellerName})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    SizedBox spaceThingy=  SizedBox(height: 7,);
    Size screenSize = Utils().getScreenSize();
    return SizedBox(
      width: screenSize.width / 2.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              productName,
              maxLines: 2,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  letterSpacing: 0.7,
                  overflow: TextOverflow.ellipsis),

            ),
          ),
          spaceThingy,
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7),
              child: CostWidget(cost: cost, color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "Sold by ",
                      style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                  TextSpan(
                      text: sellerName,
                      style: TextStyle(color: activeCyanColor, fontSize: 14))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
