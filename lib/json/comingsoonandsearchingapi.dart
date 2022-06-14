// import 'package:netflix/json/load_movies.dart';

// class ApiendPoints{
//   static const comingSoon = "$baseurl/trending/all/day?api_key=$apikey";
// }
import 'dart:convert';

import 'package:netflix/models/comingsoonclassmodels/classmodels.dart';
import 'package:http/http.dart' as http;

List<Classmodels> comingsoon =[];
  Future  fetchDatas() async {
    final response = await http.get(Uri.parse(
        "https://api.themoviedb.org/3/trending/all/day?api_key=61ddb3f11c2b0a42d4a3dc020c0dfd1c"));
    //print(response.body);

    if (response.statusCode == 200) {   
      final _response = jsonDecode(response.body);
      Iterable list = _response["results"];
      comingsoon = list.map((movie) => Classmodels.fromJson(movie)).toList();
     

    }else{    
      throw Exception("Failed}");
    }   
  }