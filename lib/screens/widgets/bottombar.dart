import 'package:flutter/material.dart';

class bottombarWidget extends StatelessWidget {
  final heading;
   bottombarWidget({
    Key? key,required this.heading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Padding(
            padding:  EdgeInsets.only(left: 10.0),
            child: Text(
              heading,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold),
            )),
        Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.collections_bookmark,
                  color: Colors.white,
                  size: 35,
                )),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/profile.jpeg",
                width: 26,
                height: 26,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ],
    );
  }
}
