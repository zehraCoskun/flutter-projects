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
  bool isSearch = false;

  Future<void> search(String searchWord) async {
    print("$searchWord");
  }

  Future<List<Persons>> uploadPersons() async {
    var p1 = Persons(id: 1, name: "zehra", number: "1234");
    var p2 = Persons(id: 2, name: "akın", number: "12345");
    var p3 = Persons(id: 3, name: "ali", number: "12346");
    var p4 = Persons(id: 4, name: "ayşe", number: "12347");
    var persons = [p1, p2, p3, p4];
    return persons;
  }

  Future<void> deletePerson(int id) async {
    print("$id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearch
            ? TextField(
                decoration: InputDecoration(hintText: "Ara"),
                onChanged: (searchResult) {
                  search(searchResult);
                },
              )
            : Text("Kişiler"),
        actions: [
          isSearch
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = false;
                    });
                  },
                  icon: Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: Icon(Icons.search),
                ),
        ],
      ),
      body: FutureBuilder(
          future: uploadPersons(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var personList = snapshot.data;
              return ListView.builder(
                  itemCount: personList!.length,
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
                                      style: TextStyle(fontSize: 28),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      person.number,
                                      style: TextStyle(fontSize: 18),
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
                                              deletePerson(person.id);
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.clear))
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return Text("Kişi Listeniz Boş");
            }
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddView())).then(
            (value) => print("geri dönüldü"), //then sayfaya geri dönüldüğünde yapılacak işleri düzenler
          );
        },
      ),
    );
  }
}
