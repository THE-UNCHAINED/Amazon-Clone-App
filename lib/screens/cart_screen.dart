import 'package:amazon_clone/modal/product_model.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/cart_item_widget.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/search_bar%20_widget.dart';
import 'package:amazon_clone/widgets/user_detail_bar.dart';
import 'package:flutter/material.dart';
import '../modal/user_details_modal.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: SearchBarWidget(
          hasBackButton: false,
          isReadOnly: true,
        ),
        body: Center(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: kAppBarHeight/2,),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: CustomMainButton(
                      child: Text(
                        "Proceed to buy(N) items",
                        style: TextStyle(color: Colors.black),
                      ),
                      color: yellowColor,
                      isLoading: false,
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return CartItemWidget(
                          product: ProductModel(
                            url:
                                "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                            productName: " Mouse",
                            cost: 9999999999,
                            rating: 1,
                            noOfRating: 2,
                            sellerName: "prashant",
                            sellerUid: "999243nj",
                            discount: 1,
                            uid: "kakfokaf",
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
              UserDetailBar(
                offset: 0,
                userDetails:
                UserDetailModal(name: "Prashant ", address: "On Earth"),
              ),
            ],

          ),
        ));
  }
}
