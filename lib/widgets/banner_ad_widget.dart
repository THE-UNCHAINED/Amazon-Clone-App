import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  @override
  Widget build(BuildContext context) {
    int currentAd = 0;
    Size screensize = Utils().getScreenSize();
    double smallAdHeight = screensize.width / 5;
    return GestureDetector(
      onHorizontalDragEnd: (_) {
        if (currentAd < largeAds.length - 1) {
          setState(() {
            currentAd+1;
          });
        } else {
          setState(() {
            currentAd = 0;
          });
        }
      },
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                largeAds[currentAd],
                width: double.infinity,
              ),
              Positioned(
                bottom: -1,
                child: Container(
                  width: screensize.width,
                  height: 105,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        backgroundColor,
                        backgroundColor.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            color: backgroundColor,
            width: screensize.width,
            height: smallAdHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getSmallAdsfromIndex(0, smallAdHeight),
                getSmallAdsfromIndex(1, smallAdHeight),
                getSmallAdsfromIndex(2, smallAdHeight),
                getSmallAdsfromIndex(3, smallAdHeight),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getSmallAdsfromIndex(int index, double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: height,
        width: height,
        decoration: ShapeDecoration(
          color: Colors.white,
          shadows: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 1)
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(smallAds[index]),
              Text(adItemNames[index]),
            ],
          ),
        ),
      ),
    );
  }
}
