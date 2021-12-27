import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pixelmovies/models/movies_model.dart';

class MoviesList extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<MoviesModel> movies = [];
  List<MoviesModel> get allMovies => movies;

  MoviesList() {
    getMovies();
  }

  Future<void> getMovies() async {
    _isLoading = true;
    notifyListeners();
    var url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=2a61185ef6a27f400fd92820ad9e8537&page=1');

    var response = await http.get(url);
    var data = jsonDecode(response.body)['results'];
    if (response.statusCode == 200) {
      for (var i = 0; i < data.length; i++) {
        movies.add(MoviesModel.fromJson(data[i]));
      }
    } else {
      throw Exception('Something went wrong');
    }
    _isLoading = false;
    notifyListeners();
  }
}
