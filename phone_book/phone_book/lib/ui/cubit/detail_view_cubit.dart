import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_book/data/repo/persons_dao_repo.dart';

class DetailViewCubit extends Cubit {
  DetailViewCubit() : super(0);

  var prepo = PersonsDaoRepo();

  Future<void> updated(int id, String name, String phone) async {
    await prepo.updated(id, name, phone);
  }
}
