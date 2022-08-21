import 'package:amazon_clone/modal/user_details_modal.dart';
import 'package:amazon_clone/utils/color_themes.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:flutter/material.dart';

class UserDetailBar extends StatelessWidget {
  final double offset;
  UserDetailModal userDetails;
  UserDetailBar({Key? key, required this.offset, required this.userDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screensize = Utils().getScreenSize();
    return Positioned(
      top: (-offset) / 5,
      child: Container(
        width: screensize.width,
        height: kAppBarHeight / 2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: lightBackgroundaGradient,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey[900],
                ),
              ),
              SizedBox(
                width: screensize.width * 0.7,
                child: Text(
                  "Deliver to ${userDetails.name}-${userDetails.address}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[900]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
