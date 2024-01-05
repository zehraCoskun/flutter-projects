import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/ui/cubit/add_view_cubit.dart';

class AddView extends StatefulWidget {
  const AddView({super.key});

  @override
  State<AddView> createState() => _HomeViewState();
}

class _HomeViewState extends State<AddView> {
  var tfName = TextEditingController();
  var tfNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kişi Ekle"),
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
                    context.read<AddViewCubit>().saved(tfName.text, tfNumber.text);
                  },
                  child: const Text("Kaydet"))
            ],
          ),
        ),
      ),
    );
  }
}
