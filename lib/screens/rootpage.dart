import 'package:flutter/material.dart';
import 'package:netflix/json/root_icons.dart';
import 'package:netflix/screens/comingsoon.dart';
import 'package:netflix/screens/homepage.dart';
import 'package:netflix/screens/serachscreen.dart';

class Rootpage extends StatefulWidget {
  const Rootpage({Key? key}) : super(key: key);

  @override
  State<Rootpage> createState() => _RootpageState();
}

class _RootpageState extends State<Rootpage> {
  bool iconColor = true;
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeIndex,
      children: const [
        Homepage(),
        Comingsoon(),
        SearchScreen(),  
        Center(
          child: Text(
            "Downloads",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(categories.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  activeIndex = index;
                  // print("==${activeIndex}");
                  iconColor = !iconColor;
                });
              },
              child: Column(
                children: [
                  Icon(
                    categories[index]['icon'],
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    categories[index]['name'],
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
