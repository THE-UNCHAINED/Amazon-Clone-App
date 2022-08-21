import 'package:amazon_clone/modal/user_details_modal.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/widgets/banner_ad_widget.dart';
import 'package:amazon_clone/widgets/categories_horizontal_list.dart';
import 'package:amazon_clone/widgets/products_showcase_list.dart';
import 'package:amazon_clone/widgets/search_bar%20_widget.dart';
import 'package:amazon_clone/widgets/simple_product_widget.dart';
import 'package:amazon_clone/widgets/user_detail_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double offset = 0;
  ScrollController controller = ScrollController();
  static const List<Widget> testChildren = [
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
    ),
    SimpleProductWidget(
      url: "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
    ),
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        offset = controller.position.pixels;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBarWidget(
        isReadOnly: true,
        hasBackButton: false,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: controller,
            child: Column(
              children: const [
                SizedBox(
                  height: kAppBarHeight / 2,
                ),
                CategoriesHorizontalList(),
                BannerAdWidget(),
                ProductsShowcaseList(
                    title: "Upto 70% Off", children: testChildren),
                ProductsShowcaseList(
                    title: "Upto 60% Off", children: testChildren),
                ProductsShowcaseList(
                    title: "Upto 50% Off", children: testChildren),
                ProductsShowcaseList(title: "Explore", children: testChildren),
              ],
            ),
          ),
          UserDetailBar(
            offset: offset,
            userDetails:
                UserDetailModal(name: "Prashant", address: " Banaras Varanasi"),
          ),
        ],
      ),
    );
  }
}
