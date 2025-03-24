import 'package:flutter/material.dart';

void _showAddSliderDialog(BuildContext context) {
  TextEditingController descriptionController = TextEditingController();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Add Slider'),
        content: TextField(
          controller: descriptionController,
          decoration: const InputDecoration(
            labelText: 'Enter description',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              String description = descriptionController.text.trim();
              if (description.isNotEmpty) {
                // print('New Slider Description: $description');
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      );
    },
  );
}
