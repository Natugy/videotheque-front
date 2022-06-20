
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


import 'package:videotheque_app/data/filmStruct.dart';
import 'package:videotheque_app/data/tmdbFilmStruct.dart';

Future<List<TmdbFilm>> fetchServerInfo() async {
  final response = await http.get(
      Uri.http("10.0.2.2:8080", "/v1/film/list"),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    final responseJson = json.decode(utf8.decode(response.bodyBytes));

    return (responseJson as List).map((p) => TmdbFilm.fromJson(p)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('marche pas');
  }
}


Future<String> post(Map<String, String?> parameter) async {
  final jsonString = json.encode(parameter);
  final response = await http.post(
    Uri.http("10.0.2.2:8080",'/v1/film/add', parameter)
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.



    return "Film add Successfully";
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.

    throw Exception('post marche pas');
  }
}

Future<void> update(Map<String, String> parameter) async {
  final response = await http.post(
    Uri.http("10.0.2.2:8080",'/v1/film/update', parameter)
  );
}

Future<void> delete(Map<String, String> parameter) async {
  final response = await http.delete(
      Uri.http("10.0.2.2:8080",'/v1/film/delete', parameter)
  );
}

Future<List<TmdbFilm>> test(String filmName) async{
  final response = await http.get(
    Uri.parse("https://api.themoviedb.org/3/search/movie?api_key=9a037028004f443a9fd4dd8c6df30903&language=fr&query=$filmName&page=1&include_adult=false")
  );

    if(response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);

      return (jsonResponse['results'] as List).map((p) => TmdbFilm.fromTmdbJson(p)).toList();
    }
    else{
      throw Exception('pastrouve');
    }

}

Future<bool> filmExist(String filmName) async {
  final param = {
    'title': filmName
  };
  final response = await http.get(
      Uri.http("10.0.2.2:8080",'/v1/film/title', param)
  );

  final jsonResponse = json.decode(response.body);
  if(response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);

    return jsonResponse;
  }
  else {
    throw Exception('marche pas');
  }
}