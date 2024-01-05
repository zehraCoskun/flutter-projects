import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/data/entity/persons.dart';
import 'package:phone_book/ui/cubit/detail_view_cubit.dart';

// ignore: must_be_immutable
class DetailView extends StatefulWidget {
  DetailView({super.key, required this.person});
  Persons person;

  @override
  State<DetailView> createState() => _HomeViewState();
}

class _HomeViewState extends State<DetailView> {
  var tfName = TextEditingController();
  var tfNumber = TextEditingController();

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
        title: const Text("Kişi Detayı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfName,
                decoration: const InputDecoration(hintText: "Kişi Adı"),
              ),
              TextField(
                controller: tfNumber,
                decoration: const InputDecoration(hintText: "Telefon Numarası"),
              ),
              ElevatedButton(
                  onPressed: () {
                    context.read<DetailViewCubit>().updated(widget.person.id, tfName.text, tfNumber.text);
                  },
                  child: const Text("Güncelle"))
            ],
          ),
        ),
      ),
    );
  }
}
