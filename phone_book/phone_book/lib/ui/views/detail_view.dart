import 'package:flutter/material.dart';
import 'package:phone_book/data/entity/persons.dart';

class DetailView extends StatefulWidget {
  DetailView({super.key, required this.person});
  Persons person;

  @override
  State<DetailView> createState() => _HomeViewState();
}

class _HomeViewState extends State<DetailView> {
  var tfName = TextEditingController();
  var tfNumber = TextEditingController();
  Future<void> updated(int id, String name, String phone) async {
    print("$name - $phone");
  }

  @override
  void initState() {
    super.initState();
    tfName.text = widget.person.name;
    tfNumber.text = widget.person.number;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Detayı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfName,
                decoration: InputDecoration(hintText: "Kişi Adı"),
              ),
              TextField(
                controller: tfNumber,
                decoration: InputDecoration(hintText: "Telefon Numarası"),
              ),
              ElevatedButton(
                  onPressed: () {
                    updated(widget.person.id, tfName.text, tfNumber.text);
                  },
                  child: const Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
