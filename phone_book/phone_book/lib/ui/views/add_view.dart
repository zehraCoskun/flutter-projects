import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _HomeViewState();
}

class _HomeViewState extends State<AddView> {
  var tfName = TextEditingController();
  var tfNumber = TextEditingController();
  Future<void> saved(String name, String phone) async {
    print("$name - $phone");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Ekle"),
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
                    saved(tfName.text, tfNumber.text);
                  },
                  child: Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
