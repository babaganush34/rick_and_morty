import 'package:flutter/material.dart';

class CharacterCardWidget extends StatelessWidget {
  const CharacterCardWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.id,
      required this.status});
  final String name;
  final String image;
  final int id;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: _statusColor(status),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      status,
                      style:
                          TextStyle(fontSize: 12, color: _statusColor(status)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Color _statusColor(String status) {
  switch (status.toLowerCase()) {
    case 'alive':
      return Colors.green;
    case 'dead':
      return Colors.red;
    default:
      return Colors.purple;
  }
}
