import 'package:amazon_clone/modal/review_model.dart';
import 'package:amazon_clone/utils/constants.dart';
import 'package:amazon_clone/utils/utils.dart';
import 'package:amazon_clone/widgets/rating_star_widget.dart';
import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final ReviewModal reviewModal;
  const ReviewWidget({Key? key, required this.reviewModal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          reviewModal.senderName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  width: screenSize.width / 4,
                  child: FittedBox(
                    child: RatingStarWidget(
                      rating: reviewModal.rating,
                    ),
                  ),
                ),
              ),
              Text(keysOfRating[reviewModal.rating - 1])
            ],
          ),
        ),
        Text(
          reviewModal.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
