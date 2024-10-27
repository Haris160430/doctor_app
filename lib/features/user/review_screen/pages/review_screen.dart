import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mardanorthodonticcenter/core/theme/App_Colors.dart';

import '../../add_review/paages/add_review.dart';

class Review {
  final String name;
  final double rating;
  final String reviewText;
  final String timeAgo;

  Review({
    required this.name,
    required this.rating,
    required this.reviewText,
    required this.timeAgo,
  });
}

class ReviewScreen extends StatelessWidget {
  final List<Review> reviews = [
    Review(
      name: 'Ayushi Keshari',
      rating: 5.0,
      reviewText:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra.',
      timeAgo: '20 mins ago',
    ),
    Review(
      name: 'Roushni Singh',
      rating: 4.0,
      reviewText:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.',
      timeAgo: '2 hours ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return
      Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        review.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          RatingBarIndicator(
                                            rating: review.rating,
                                            itemBuilder: (context, _) =>
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize: 16.0,
                                            direction: Axis.horizontal,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            review.rating.toString(),
                                            style: const TextStyle(
                                                fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  review.timeAgo,
                                  style: const TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              review.reviewText,
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AddReviewDialog(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Write Review',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ]
      );
  }

}


