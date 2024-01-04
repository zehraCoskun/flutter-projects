import 'package:flutter/material.dart';
import 'package:phone_book/data/entity/persons.dart';
import 'package:phone_book/ui/views/add_view.dart';
import 'package:phone_book/ui/views/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişiler"),
      ),
      body: ElevatedButton(
          onPressed: () {
            var person = Persons(id: 1, name: "zehra", number: "123");
            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailView(person: person)));
          },
          child: Text("detay deneme")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddView())).then(
            (value) => print("geri dönüldü"), //then sayfaya geri dönüldüğünde yapılacak işleri düzenler
          );
        },
      ),
    );
  }
}
