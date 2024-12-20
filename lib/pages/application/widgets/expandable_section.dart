import 'package:flutter/material.dart';

Widget buildExpandableSection({
  required String title,
  bool isExpanded = false,
  VoidCallback? onToggle,
  required IconData icon,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      GestureDetector(
        onTap: onToggle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.teal,
              ),
            ),
            isExpanded
                ? Icon(
                    icon,
                    color: Colors.teal,
                  )
                : Icon(
                    Icons.expand_less,
                    color: Colors.teal,
                  ),
          ],
        ),
      ),
      if (isExpanded)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text('Nội dung $title'), // Placeholder for detailed content
        ),
    ],
  );
}
