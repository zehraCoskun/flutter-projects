import 'package:flutter/material.dart';
import 'package:movies_book/data/entity/movies.dart';
import 'package:movies_book/ui/views/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler"),
      ),
      body: FutureBuilder<List<Movies>>(
        future: uploadMovies(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var movieList = snapshot.data;
            return GridView.builder(
              itemCount: movieList!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 2.3),
              itemBuilder: (context, index) {
                var movie = movieList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailView(
                                  movie: movie,
                                )));
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/${movie.image}"),
                        Text(
                          "${movie.name}",
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(
                          "${movie.price}",
                          style: const TextStyle(fontSize: 24),
                        ),
                        ElevatedButton(onPressed: () {}, child: const Icon(Icons.shopping_basket_outlined))
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Text("Listeniz Boş");
          }
        },
      ),
    );
  }
}
