import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPageHeader extends StatelessWidget {
  const DetailPageHeader({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(CupertinoIcons.multiply,
                    color: Colors.grey.shade700, size: 30)),
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  letterSpacing: 1.5,
                  fontSize: 30,
                  color: Colors.grey.shade700),
            ),
          ],
        ),
        // const SizedBox(height: 5),
        Divider(
          color: color,
          thickness: 2,
        )
      ],
    );
  }
}
