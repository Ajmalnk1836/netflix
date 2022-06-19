import 'package:flutter/material.dart';
import 'package:netflix/json/home_json.dart';

import 'package:netflix/screens/detailspage.dart';
import 'package:tmdb_api/tmdb_api.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    loadmovies();
    super.initState();
  }

  List trendingmovies = [];
  List toprated = [];
  List tvshows = [];
  List upcoming = [];
  List latest = [];
  final String apikey = '61ddb3f11c2b0a42d4a3dc020c0dfd1c';
  final readacesstoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MWRkYjNmMTFjMmIwYTQyZDRhM2RjMDIwYzBkZmQxYyIsInN1YiI6IjYyYTQ5NDg2ODUwMDVkMmIxNmNmY2M4YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.qWKBA3hCdpPK0o8-CNXai296l3gJCtVXjGh2lrDfVhw';

  loadmovies() async {
    TMDB tmdbWIthCustomLogs = TMDB(ApiKeys(apikey, readacesstoken),
        logConfig: const ConfigLogger(
          showLogs: true,
          showErrorLogs: true,
        ));

    Map trendingresult = await tmdbWIthCustomLogs.v3.trending.getTrending();
    Map topratedresult = await tmdbWIthCustomLogs.v3.movies.getTopRated();
    Map movieshowa = await tmdbWIthCustomLogs.v3.movies.getPopular();
    Map upcomings = await tmdbWIthCustomLogs.v3.movies.getUpcoming();
    Map tvpopulars = await tmdbWIthCustomLogs.v3.movies.getNowPlaying(); 

//print(trendingresult);

    setState(() {
      trendingmovies = trendingresult['results'];
      toprated = topratedresult['results'];
      tvshows = movieshowa['results'];
      upcoming = upcomings['results'];
      latest = tvpopulars['results'];

      print("tv shows = ${latest}"); 
    });
    //print(trendingmovies);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: getbody(),
    );
  }

  Widget getbody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: size.height - 80,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        Container(
                          height: 500,
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/banner.webp"),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          height: 500,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.85),
                                Colors.black.withOpacity(0),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                        Container(
                          height: 500,
                          width: size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/title_img_2.webp",
                                width: 300,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text(
                                "Adventure",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "My List",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              right: 13, left: 8, top: 2, bottom: 2),
                          child: Row(
                            children: const [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.black,
                                size: 30,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Play ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(
                        children: const [
                          Icon(
                            Icons.info,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Info ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15),
                          child: Text(
                            "My List",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children:
                                  List.generate(trendingmovies.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    // print("movies= $trendingmovies  ");
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return Detailspage(
                                        name: trendingmovies[index]['title'],
                                        bannerurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                trendingmovies[index]
                                                    ['backdrop_path'],
                                        posterurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                trendingmovies[index]
                                                    ['poster_path'],
                                        description: trendingmovies[index]
                                            ['overview'],
                                        vote: trendingmovies[index]
                                                ['vote_average']
                                            .toString(),
                                        launching_Date: trendingmovies[index]
                                            ['release_date'],
                                      );
                                    }));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 110,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'http://image.tmdb.org/t/p/w500' +
                                                    trendingmovies[index]
                                                        ['poster_path']),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15),
                          child: Text(
                            "Popular on Netflix",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: List.generate(toprated.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return Detailspage(
                                        name: toprated[index]['title'],
                                        bannerurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                toprated[index]
                                                    ['backdrop_path'],
                                        posterurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                toprated[index]['poster_path'],
                                        description: toprated[index]
                                            ['overview'],
                                        vote: toprated[index]['vote_average']
                                            .toString(),
                                        launching_Date: toprated[index]
                                            ['release_date'],
                                      );
                                    }));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 110,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'http://image.tmdb.org/t/p/w500' +
                                                    toprated[index]
                                                        ['poster_path']),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15),
                          child: Text(
                            "Trending List",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: List.generate(tvshows.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Detailspage(
                                        name: tvshows[index]['title'],
                                        bannerurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                tvshows[index]['backdrop_path'],
                                        posterurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                tvshows[index]['poster_path'],
                                        description: tvshows[index]['overview'],
                                        vote: tvshows[index]['vote_average']
                                            .toString(),
                                        launching_Date: tvshows[index]
                                            ['release_date'],
                                      );
                                    }));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 110,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'http://image.tmdb.org/t/p/w500' +
                                                    tvshows[index]
                                                        ['poster_path']),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15),
                          child: Text(
                            "Netflix Originals",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: List.generate(latest.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Detailspage(
                                        name: latest[index]['title'],
                                        bannerurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                latest[index]
                                                    ['backdrop_path'],
                                        posterurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                latest[index]['poster_path'],
                                        description: latest[index]
                                            ['overview'],
                                        vote: latest[index]['vote_average']
                                            .toString(),
                                        launching_Date: latest[index]
                                            ['release_date'],
                                      );
                                    }));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 165,
                                    height: 300,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'http://image.tmdb.org/t/p/w500' +
                                                    latest[index]
                                                        ['poster_path']),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15.0, right: 15),
                          child: Text(
                            "Anime",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children:
                                  List.generate(upcoming.length, (index) {
                                return GestureDetector(
                                   onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      return Detailspage(
                                        name: latest[index]['title'],
                                        bannerurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                upcoming[index]
                                                    ['backdrop_path'],
                                        posterurl:
                                            'http://image.tmdb.org/t/p/w500' +
                                                upcoming[index]['poster_path'],
                                        description: latest[index]
                                            ['overview'],
                                        vote: latest[index]['vote_average']
                                            .toString(),
                                        launching_Date: latest[index]
                                            ['release_date'],
                                      );
                                    }));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    width: 110,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            // image: AssetImage(
                                            //     trendingList[index]["img"]),
                                            image: NetworkImage(
                                                'http://image.tmdb.org/t/p/w500' +
                                                    upcoming[index]     
                                                        ['poster_path']),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),   
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: SafeArea(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Image.asset(
                            'assets/images/logo.ico',
                            width: 35,
                            fit: BoxFit.cover,
                          ),
                        ),
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
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Tv Shows",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const Text(
                          "Movies",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: const [
                            Text(
                              "Categories",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ],
                    )
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
