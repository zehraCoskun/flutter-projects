import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/ui/cubit/add_view_cubit.dart';
import 'package:phone_book/ui/cubit/detail_view_cubit.dart';
import 'package:phone_book/ui/cubit/home_view_cubit.dart';
import 'package:phone_book/ui/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AddViewCubit()),
        BlocProvider(create: (context) => DetailViewCubit()),
        BlocProvider(create: (context) => HomeViewCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
