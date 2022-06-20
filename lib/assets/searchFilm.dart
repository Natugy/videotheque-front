
import 'package:flutter/material.dart';

import '../data/tmdbFilmStruct.dart';
import 'filmTmdbCard.dart';

class SearchFilm extends StatelessWidget {
  const SearchFilm({Key? key, required this.filmList}) : super(key: key);

  final Future<List<TmdbFilm>> filmList;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TmdbFilm>>(
      future: filmList,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const CircularProgressIndicator();
          default:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {

              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context, position) {
                    return TmdbFilmCard(film: snapshot.data![position]);
                  }
              );
            }
        }
      },
    );
  }
}
