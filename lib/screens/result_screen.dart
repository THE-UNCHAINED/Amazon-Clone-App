import 'package:amazon_clone/modal/product_model.dart';
import 'package:amazon_clone/widgets/results_widget.dart';
import 'package:amazon_clone/widgets/search_bar%20_widget.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String query;
  const ResultScreen({Key? key, required this.query}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: false,
        hasBackButton: true,
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Showing results for  ",
                      style: TextStyle(fontSize: 17),
                    ),
                    TextSpan(
                      text: query,
                      style:
                          TextStyle(fontSize: 17, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2 / 3),
              itemBuilder: (context, index) {
                return ResultsWidgets(
                  product: ProductModel(
                    url:
                        "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
                    productName: " Mouse",
                    cost: 100,
                    rating: 4,
                    noOfRating: 2,
                    sellerName: " Prashant",
                    sellerUid: "999243nj",
                    discount: 1,
                    uid: "kakfokaf",
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
