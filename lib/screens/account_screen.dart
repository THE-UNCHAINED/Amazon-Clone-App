import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/account_screen_app_bar.dart';
import 'package:amazon_clone/widgets/custom_main_button.dart';
import 'package:amazon_clone/widgets/products_showcase_list.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AccountScreenAppBar(),
        body: SingleChildScrollView(
          child: SizedBox(
            height: screensize.height,
            width: screensize.width,
            child: Column(
              children: [
                IntroductionWidgetAccountScreen(),
                SizedBox(height: 20),
                CustomMainButton(
                    color: Colors.orange,
                    child: Text(
                      "Sign In",
                      style: TextStyle(color: Colors.black),
                    ),
                    isLoading: false,
                    onPressed: () {}),
                SizedBox(height: 10),
                CustomMainButton(
                    color: Colors.yellow,
                    child: Text(
                      "SELL",
                      style: TextStyle(color: Colors.black),
                    ),
                    isLoading: false,
                    onPressed: () {}),
                ProductsShowcaseList(
                    title: "Your Orders", children: testChildren),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Order Requests ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          "Order: Black Shoe",
                          style: TextStyle(fontWeight: FontWeight.w300),
                        ),
                        subtitle: Text('Somewhere on Earth'),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.check),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class IntroductionWidgetAccountScreen extends StatelessWidget {
  const IntroductionWidgetAccountScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight / 2,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: backgroundGradient,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight),
      ),
      child: Container(
        height: kAppBarHeight / 2,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.white12,
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: "Hello  ",
                        style:
                            TextStyle(color: Colors.grey[800], fontSize: 26)),
                    TextSpan(
                      text: "Prashant",
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage("https://www.gojinshi."
                    "com/wp-content/uploads/2021/06/Is-The-Lion-Sin-of-Pride"
                    "-Escanor-Dead-In-The-Seven-Deadly-Sins.jpg"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
