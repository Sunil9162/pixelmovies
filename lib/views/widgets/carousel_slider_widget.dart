import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pixelmovies/logics/movies_list_provider.dart';
import 'package:provider/provider.dart';

class MoviesSlider extends StatefulWidget {
  const MoviesSlider({Key? key}) : super(key: key);

  @override
  _MoviesSliderState createState() => _MoviesSliderState();
}

class _MoviesSliderState extends State<MoviesSlider> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Expanded(
            child: Consumer<MoviesList>(
              builder: (BuildContext context, data, Widget? child) =>
                  CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (_, i, j) {
                  if (!data.isLoading) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            data.allMovies[i].backdropPath,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          data.allMovies[i].title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  }
                },
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 15 / 6,
                  enlargeCenterPage: true,
                  onPageChanged: (i, reason) {
                    setState(() {
                      _currentIndex = i;
                    });
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 20,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.center,
              child: ListView.builder(
                shrinkWrap: true,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor:
                          i == _currentIndex ? Colors.blue : Colors.grey,
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
