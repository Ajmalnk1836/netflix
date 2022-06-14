
import 'package:flutter/material.dart';
import 'package:netflix/json/comingsoonandsearchingapi.dart';
import 'package:netflix/models/comingsoonclassmodels/classmodels.dart';
//import 'package:tmdb_api/tmdb_api.dart';

class Comingsoon extends StatefulWidget {
  const Comingsoon({Key? key}) : super(key: key);

  @override
  State<Comingsoon> createState() => _ComingsoonState();
}

class _ComingsoonState extends State<Comingsoon> {
  @override
  void initState() {
   fetchDatas();
    super.initState();
  }
   

  // List<Classmodels> comingsoon =[];
  // Future  fetchDatas() async {
  //   final response = await http.get(Uri.parse(
  //       "https://api.themoviedb.org/3/trending/all/day?api_key=61ddb3f11c2b0a42d4a3dc020c0dfd1c"));
  //   //print(response.body);

  //   if (response.statusCode == 200) {
  //     final _response = jsonDecode(response.body);
  //     Iterable list = _response["results"];
  //     comingsoon = list.map((movie) => Classmodels.fromJson(movie)).toList();
     

  //   }else{ 
  //     throw Exception("Failed}");
  //   }   
  // }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //  appBar: getAppbar(),
      body: getBody(),
    );
  }
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                 const   SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                            padding:  EdgeInsets.only(left: 10.0),
                            child: Text(
                              "Coming soon",
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
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.white.withOpacity(0.9),
                          ),
                          const Padding(
                            padding:  EdgeInsets.all(8.0),
                            child: Text(
                              "Notification",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                    Column(
                        children: List.generate(comingsoon.length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [   
                         const SizedBox(   
                            height: 20,
                          ),
                          Container(
                            height: 250,  
                            child: Stack(
                              children: [   
                                Container(
                                  width: MediaQuery.of(context).size.width, 
                                  child: Image.network('http://image.tmdb.org/t/p/w500' + comingsoon[index].posterPath!   ,
                                  fit: BoxFit.cover,         
                                 // width: 27,      
                                   ),
                                ), 
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20.0, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Image.network('http://image.tmdb.org/t/p/w500' + comingsoon[index].backdropPath!,fit: BoxFit.cover,
                                width: 120,),
                                Row(
                                  children: [
                                    Column(
                                      children: const [
                                        Icon(
                                          Icons.notifications_none_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Remind me",
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                       const   SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Text("Release Date -  ${comingsoon[index].releaseDate}",
                              style:const TextStyle(color: Colors.grey),
                            ),
                          ),
                        const  SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Text(
                             comingsoon[index].originalTitle.toString(), 
                              style:const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                       const   SizedBox(
                            height: 15,
                          ),
                          // Text(comingsoonJson[index]["title"]),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Text(
                             comingsoon[index].overview!,
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.4),
                                  fontSize: 18),
                            ),
                          ),
                        const  SizedBox(
                            height: 10,
                          ),
                          // Text(comingsoonJson[index]["title"]),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10),
                            child: Text(
                             comingsoon[index].mediaType!,
                              style:
                                const  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ],
                      );
                    }))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
