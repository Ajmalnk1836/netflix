
import 'package:flutter/material.dart';
import 'package:netflix/json/comingsoonandsearchingapi.dart';
import 'package:netflix/screens/widgets/bottombar.dart';


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
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      //  appBar: getAppbar(),
      body:  getBody(),
         
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
                    bottombarWidget(heading: "Coming Soon"),
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
                            height: 400    ,    
                            child: Stack(
                              children: [   
                                Container(
                                  width: MediaQuery.of(context).size.width, 
                                  child: Image.network('http://image.tmdb.org/t/p/w500' + comingsoon[index].posterPath!   ,
                                  fit: BoxFit.fill        ,         
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
                             comingsoon[index].originalTitle.toString() , 
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

