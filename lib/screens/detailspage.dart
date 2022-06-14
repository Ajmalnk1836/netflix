import 'package:flutter/material.dart';

class Detailspage extends StatefulWidget {
  //final List<dynamic> names;
  final String? name, description, bannerurl, vote, posterurl, launching_Date;

  Detailspage({
    Key? key,
    //required this.names,
    this.name,
    this.description,
    this.bannerurl,
    this.vote,
    this.posterurl,
    this.launching_Date,
    //required this.poster,required this.description
  }) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  void initState() {
    //  for (var prop in widget.names) {
    //     print(prop);
    //  }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: ListView(
      children: [
        Container(
          height: 250,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child:
                      // Text(widget.name.toString(),style: TextStyle(color: Colors.white),)
                      Image.network(
                    widget.bannerurl!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  bottom: 10,
                  child: Text(
                    "Average Rating -- ${widget.vote} ",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${widget.name != null ? widget.name : "Not loaded"}',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "Releasing on -${widget.launching_Date} ",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 200,
              width: 100,
              child: Image.network(widget.posterurl!),
            ),
            Flexible(
              child: Container(
                child: Text(
                  widget.description!,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
