import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:movie_review/data/models/movie_list_model.dart';
import 'package:movie_review/data/repositories/dio_handler/dio_handler.dart';

class movieRepository{
  
  Dio _dio = Dio();
  // DioHandler _dioHandler = DioHandler();

  
  Future<List<MovieListModel>> fetchMovieList()async{
    Future<http.Response> response;
   var  url = Uri.parse("https://api.themoviedb.org/3/tv/top_rated?api_key=0cb8553727794316c0640fab343cfc04&language=en-US&page=1");
    try{
      final  response = await http.get(url);
      var list =jsonDecode(response.body);


      // Response response =  await _dio.get("https://api.themoviedb.org/3/tv/top_rated?api_key=0cb8553727794316c0640fab343cfc04&language=en-US&page=1");
      //Response response = await _dioHandler.dio.get('api_key=0cb8553727794316c0640fab343cfc04&language=en-US&page=1');
      // List list = response.data;
      print(response.body);
     return list.map((e) => MovieListModel.fromJson(e)).toList();
    }catch(ex){
      throw ex;
    }
  }
}