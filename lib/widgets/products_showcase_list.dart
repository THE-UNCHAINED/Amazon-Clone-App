import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class ProductsShowcaseList extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const ProductsShowcaseList(
      {Key? key, required this.title, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    double height = screensize.height / 4;
    double titleHeight = 25;
    return Container(
      margin: EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: height,
      width: screensize.width,
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 7),
                child: SizedBox(
                  height: titleHeight,
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 14),
                child: const Text(
                  'Show more',
                  style: TextStyle(color: activeCyanColor),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height - (titleHeight + 20),
            width: screensize.width,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
