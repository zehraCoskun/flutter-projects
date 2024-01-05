import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/data/entity/persons.dart';
import 'package:phone_book/ui/cubit/home_view_cubit.dart';
import 'package:phone_book/ui/views/add_view.dart';
import 'package:phone_book/ui/views/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  bool isSearch = false;
  @override
  void initState() {
    super.initState();
    context.read<HomeViewCubit>().uploadPersons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: const InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  context.read<HomeViewCubit>().search(searchResult);
                },
              )
            : const Text("Kişiler"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                    context.read<HomeViewCubit>().uploadPersons();
                  },
                  icon: const Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
        ],
      ),
      body: BlocBuilder<HomeViewCubit, List<Persons>>(builder: (context, personList) {
        if (personList.isNotEmpty) {
          return ListView.builder(
              itemCount: personList.length,
              itemBuilder: (context, index) {
                var person = personList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: GestureDetector(
                    onTap: () {
                      print("${person.name} seçildi");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailView(person: person)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  person.name.toUpperCase(),
                                  style: const TextStyle(fontSize: 28),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  person.number,
                                  style: const TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("${person.name} silinsin mi?"),
                                      action: SnackBarAction(
                                        label: "Silinsin",
                                        onPressed: () {
                                          context.read<HomeViewCubit>().deletePerson(person.id);
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.clear))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        } else {
          return const Text("Kişi Listeniz Boş");
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddView())).then(
            (value) => print("geri dönüldü"), //then sayfaya geri dönüldüğünde yapılacak işleri düzenler
          );
        },
      ),
    );
  }
}
