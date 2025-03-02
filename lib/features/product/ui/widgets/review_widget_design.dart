import 'package:ecomers_app/features/product/model/review_list_model.dart';
import 'package:flutter/material.dart';

class ReviewWidgetDesign extends StatelessWidget {
  const ReviewWidgetDesign({super.key, required this.reviewModel});
  final ReviewModel reviewModel;

  @override
  Widget build(BuildContext context) {
    int fullStars = reviewModel.rating?.floor() ?? 0;
    bool hasHalfStar = (reviewModel.rating ?? 0) - fullStars >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 14,
                  child: Icon(Icons.person, size: 20),
                ),
                const SizedBox(width: 8),
                Text(
                  '${reviewModel.user!.firstName!} ${reviewModel.user!.lastName!}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              reviewModel.comment ?? 'No comment available',
              textAlign: TextAlign.start,
              style: const TextStyle(color: Colors.grey,),
            ),
            const SizedBox(height: 8),
            // Rating Row
            Row(
              children: [
                ...List.generate(
                    fullStars,
                    (_) =>
                        const Icon(Icons.star, color: Colors.amber, size: 18)),
                if (hasHalfStar)
                  const Icon(Icons.star_half, color: Colors.amber, size: 18),
                ...List.generate(
                    emptyStars,
                    (_) => const Icon(Icons.star_border,
                        color: Colors.amber, size: 18)),
                const SizedBox(width: 8),
                Text('${reviewModel.rating}',
                    style: const TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
