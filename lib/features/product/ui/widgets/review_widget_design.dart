import 'package:flutter/material.dart';

class ReviewWidgetDesign extends StatelessWidget {
  const ReviewWidgetDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person, size: 20),
                  radius: 14,
                ),
                SizedBox(width: 8),
                Text(
                  'Billal Hossan',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(height: 8),
            Text(
              'The SmartFit Fitness Band 5 is your perfect companion for a '
                  'healthier lifestyle. Equipped with a sleek design and advanced features, '
                  'this fitness tracker keeps you updated on your health and activity goals.',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            // Rating Row
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star, color: Colors.amber, size: 18),
                Icon(Icons.star_half, color: Colors.amber, size: 18), // Half star
                Icon(Icons.star_border, color: Colors.amber, size: 18), // Empty star
                SizedBox(width: 8),
                Text('4.5', style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
