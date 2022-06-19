import 'package:flutter/material.dart';
import 'package:netflix/json/comingsoonandsearchingapi.dart';
import 'package:netflix/json/home_json.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
     appBar: AppBar(
      backgroundColor: Colors.black,
      title: Container(
        height: 35, 
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          borderRadius: BorderRadius.circular(6),
        

     ),  
     child: TextField(
      cursorColor: Colors.white,
       
      decoration:InputDecoration(
        
        border: InputBorder.none,
        hintText: " Searchs",
        prefixIcon: Icon(Icons.search,color: Colors.white.withOpacity(0.5),)
      ) ,
     ),
      ),
     ),
     body: getBody(),

    );
    
  }
  Widget getBody(){
    var size = MediaQuery.of(context).size;
    return SafeArea(child:
    SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
         const Text("Top Searchs",
          style: TextStyle(
            color: Colors.white,
          fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
       const   SizedBox(height: 12,),
          Column(
            children:List.generate(comingsoon.length, (index) {
              return Padding(
                padding: const EdgeInsets.only( bottom: 10), 
                child: Row(  
                  children: [
                      Container(
                        width: (size.width - 36) *0.9  ,
                        height: 80,
                        decoration:const BoxDecoration(
                          //color: Colors.green
                        ),
                        child: Row(
                          children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 70,
                                   
                                    child: Image.network('http://image.tmdb.org/t/p/w500' + comingsoon[index].posterPath!,
                                    fit: BoxFit.cover,),
                                  ),
                                  Container(
                                    width: 120,
                                    height: 70,
                                    decoration:const BoxDecoration(
                                     // color: Colors.red
                                    ),
                                  ),
                                ],
                              ),
                           const   SizedBox(width: 10,),
                              Container(
                                width:(size.width-36) * 0.4,
                                child:Text(comingsoon[index].title.toString() == "null" 
                                ? "Not released yet"      
                                :  comingsoon[index].title.toString(),style:const TextStyle(color: Colors.white,   
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                ),
                              ) ,
                              ),
                              

                          ],
                        ),
                      ),
                       Container(
                        width: (size.width - 36) * 0.2  ,    
                        height: 80,
                        child: Center(
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2,
                              color: Colors.white)
                            ),
                            child:const Center(
                              child: Icon(Icons.play_arrow,
                              color: Colors.white,),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    )
    
    );
  }
  
  
  
}