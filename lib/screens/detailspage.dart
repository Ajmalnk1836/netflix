import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
              
                  child: Text(
                    " ⭐ Average Rating -- ${widget.vote ?? "Not Published" } ",         
                    style:
                     GoogleFonts.montserrat(color: Colors.white, fontSize: 18), 
                  )

        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name ?? "Not Published",
              style: GoogleFonts.montserrat(fontSize: 24, color: Colors.white,fontWeight: FontWeight.bold), 
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
        SizedBox(height: 10,), 
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(5),
              height: 200,
            //  width: 100,
              child: Image.network(widget.posterurl!,
              fit: BoxFit.fitWidth     ,),    
            ),
            Flexible(  
                
              child: Container(
                child: Text(
                  widget.description!,
                  style: GoogleFonts.montserrat(fontSize: 18, color: Colors.white,fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }   
}
