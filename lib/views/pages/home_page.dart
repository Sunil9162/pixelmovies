import 'package:flutter/material.dart';
import 'package:pixelmovies/logics/movies_list_provider.dart';
import 'package:pixelmovies/views/pages/search_page.dart';
import 'package:pixelmovies/views/widgets/carousel_slider_widget.dart';
import 'package:pixelmovies/views/widgets/trending_movies.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PIXEL MOVIES',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SearchPage(),
                ),
              );
            },
            splashRadius: 25,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Consumer<MoviesList>(
        builder: (BuildContext context, value, Widget? child) => value.isLoading
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    CircularProgressIndicator(),
                    Text('Getting Movies'),
                  ],
                ),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    MoviesSlider(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Trending Movies',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TrendingMovies(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'New Movies',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TrendingMovies(),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'New Movies',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TrendingMovies(),
                  ],
                ),
              ),
      ),
    );
  }
}
