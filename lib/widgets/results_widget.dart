import 'package:amazon_clone/modal/product_model.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ResultsWidgets extends StatelessWidget {
  final ProductModel product;
  const ResultsWidgets({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width / 3,
              child: Image.network(
                product.url,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                product.productName,
                maxLines: 2,overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Row(
                children: [
                  FittedBox(child: RatingStarWidget(rating: product.rating)),
                  SizedBox(
                    width: screenSize.width / 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        product.noOfRating.toString(),
                        style: TextStyle(color: activeCyanColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
              child: FittedBox(
                child: CostWidget(cost: product.cost, color: Colors.redAccent),
              ),
            )
          ],
        ),
      ),
    );
  }
}
