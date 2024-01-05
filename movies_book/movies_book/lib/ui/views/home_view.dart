import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_book/data/entity/movies.dart';
import 'package:movies_book/ui/cubit/home_view_cubit.dart';
import 'package:movies_book/ui/views/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeViewCubit>().uploadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Filmler"),
      ),
      body: BlocBuilder<HomeViewCubit, List<Movies>>(
        builder: (context, movieList) {
          if (movieList.isNotEmpty) {
            return GridView.builder(
              itemCount: movieList.length,
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
