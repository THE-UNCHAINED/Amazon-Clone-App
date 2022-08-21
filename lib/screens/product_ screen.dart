import 'package:amazon_clone/modal/product_model.dart';
import 'package:amazon_clone/modal/review_model.dart';
import 'package:amazon_clone/modal/user_details_modal.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/cost_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/custom_simple_rounded_button.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:amazon_clone/widgets/review_widget.dart';
import 'package:amazon_clone/widgets/search_bar%20_widget.dart';
import 'package:amazon_clone/widgets/user_detail_bar.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final ProductModel productModel;
  ProductScreen({Key? key, required this.productModel}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Expanded spaceThingy = Expanded(child: Container());
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: screenSize.height -
                        (kAppBarHeight + (kAppBarHeight / 2)),
                    child: Column(
                      children: [
                        SizedBox(height: kAppBarHeight / 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.productModel.sellerName,
                                    style: TextStyle(
                                        color: activeCyanColor, fontSize: 17)),
                                Text(widget.productModel.productName),
                              ],
                            ),
                            RatingStarWidget(rating: widget.productModel.rating)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            height: screenSize.height / 3,
                            constraints: BoxConstraints(
                                maxHeight: screenSize.height / 3),
                            child: Image.network(
                              widget.productModel.url,
                            ),
                          ),
                        ),
                        CostWidget(
                            cost: widget.productModel.cost,
                            color: Colors.black),
                        spaceThingy,
                        CustomMainButton(
                            color: Colors.orangeAccent,
                            child: Text("Buy Now"),
                            isLoading: false,
                            onPressed: () {}),
                        spaceThingy,
                        CustomMainButton(
                            color: yellowColor,
                            child: Text("Add to Cart"),
                            isLoading: false,
                            onPressed: () {}),
                        spaceThingy,
                        CustomSimpleRoundedButton(
                            onPressed: () {},
                            text: "Add a review for this Product"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: ReviewWidget(
                              reviewModal: ReviewModal(
                                  senderName: "Prashant",
                                  description:
                                      "Very bad  Product, It was received half Broken",
                                  rating: 3)),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          UserDetailBar(
            offset: 0,
            userDetails: UserDetailModal(
                name: "Prashant", address: "Somewhere on earth"),
          )
        ],
      ),
    );
  }
}
