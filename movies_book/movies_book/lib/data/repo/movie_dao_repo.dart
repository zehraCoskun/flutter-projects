import 'package:movies_book/data/entity/movies.dart';

class MoviewDaoRepo{


  Future<List<Movies>> uploadMovies() async {
    var moviesList = <Movies>[];
    var m1 = Movies(id: 1, name: "Django", image: "django.png", price: 24);
    var m2 = Movies(id: 2, name: "Interstellar", image: "interstellar.png", price: 32);
    var m3 = Movies(id: 3, name: "Inception", image: "inception.png", price: 16);
    var m4 = Movies(id: 4, name: "The Hateful Eight", image: "thehatefuleight.png", price: 28);
    var m5 = Movies(id: 5, name: "The Pianist", image: "thepianist.png", price: 18);
    var m6 = Movies(id: 6, name: "Anadoluda", image: "anadoluda.png", price: 10);
    moviesList.add(m1);
    moviesList.add(m2);
    moviesList.add(m3);
    moviesList.add(m4);
    moviesList.add(m5);
    moviesList.add(m6);
    return moviesList;
  }
}