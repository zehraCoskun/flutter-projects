import 'package:flutter/material.dart';
import 'package:movies_book/data/entity/movies.dart';

class DetailView extends StatefulWidget {
  DetailView({super.key, required this.movie});
  Movies movie;

  @override
  State<DetailView> createState() => _HomeViewState();
}

class _HomeViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Film"),
      ),
      body: Center(
        child: Column(
          children: [Image.asset("assets/images/${widget.movie.image}"), Text(widget.movie.name), Text("${widget.movie.price} ₺")],
        ),
      ),
    );
  }
}
