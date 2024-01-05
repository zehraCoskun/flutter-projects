import 'package:phone_book/data/entity/persons.dart';

class PersonsDaoRepo {

  Future<void> saved(String name, String phone) async {
    print("$name - $phone");
  }

    Future<void> updated(int id, String name, String phone) async {
    print("$name - $phone");
  }

    Future<void> deletePerson(int id) async {
    print("$id");
  }

    Future<List<Persons>> uploadPersons() async {
    var p1 = Persons(id: 1, name: "zehra", number: "1234");
    var p2 = Persons(id: 2, name: "akın", number: "12345");
    var p3 = Persons(id: 3, name: "ali", number: "12346");
    var p4 = Persons(id: 4, name: "ayşe", number: "12347");
    var persons = [p1, p2, p3, p4];
    return persons;
  }

    Future<List<Persons>>search(String searchWord) async {
    var p1 = Persons(id: 1, name: "zehra", number: "1234");
    var persons = [p1];
    return persons;
  }
}
