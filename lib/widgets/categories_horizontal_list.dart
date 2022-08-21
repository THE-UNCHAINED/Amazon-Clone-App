import 'package:amazon_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class CategoriesHorizontalList extends StatelessWidget {
  const CategoriesHorizontalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kAppBarHeight,
      width: double.infinity,
      color: Colors.white,
      child: GestureDetector(

        onTap: () {},
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(categoryLogos[index]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(categoriesList[index]),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
