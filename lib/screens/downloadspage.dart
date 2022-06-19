import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/screens/widgets/bottombar.dart';

class DownloadsPage extends StatelessWidget {
  const DownloadsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(context),
    );
  }

  Widget getBody(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Column(
      children: [
        bottombarWidget(heading: "Downloads"),
        Container(
          height: 50,
          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text("Smart Downloads",
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                    )),
                const SizedBox(
                  width: 3,
                ),
                const Text(
                  "ON ",
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        Column(
          children: [
            Container(
              height: 190,
              width: 190,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2), shape: BoxShape.circle),
              child: Icon(Icons.download,
                  color: Colors.grey.withOpacity(0.3), size: 80),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Never be without Netflix",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40.0, right: 40),
              child: Text(
                "Download shows and movies you will never without something to watch when you are offline.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 50,
              width: size.width * 0.85,
              decoration: const BoxDecoration(color: Colors.white),
              child: const Center(
                child: Text(
                  "See What you can Download",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
      ],
    ));
  }
}
