import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/data/repo/persons_dao_repo.dart';

class AddViewCubit extends Cubit {
  AddViewCubit() : super(0);

  var prepo = PersonsDaoRepo();

  Future<void> saved(String name, String phone) async {
    await prepo.saved(name, phone);
  }
}
