
import 'package:flutter/cupertino.dart';
import 'package:movie_review/data/models/movie_list_model.dart';
import 'package:movie_review/data/repositories/movie_list_repository.dart';

class ProviderState extends ChangeNotifier{

  List<MovieListModel> movieList =[];
  bool isLoading = false;

  ProviderState(){
    fetchMovieList();
  }

  void fetchMovieList()async{
    movieList = await movieRepository().fetchMovieList();
    isLoading = true;
    notifyListeners();
  }

}