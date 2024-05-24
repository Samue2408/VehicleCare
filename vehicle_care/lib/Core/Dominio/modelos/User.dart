import 'package:vehicle_care/Core/Dominio/modelos/Car.dart';


abstract class Users {
  final int id;
  final String name_o_email;
  final String cellphone;
  final String password;
  final String type_user; 
  final List<Car> cars;

  Users(
    {
      required this.id,
      required this.name_o_email,
      required this.cellphone,
      required this.password,
      required this.type_user,
      required this.cars,
    }
  );
/*
  factory User.fromJson(Map<String, dynamic> json){
    var tarea_list = json['tasks'] as List;
    List<Tasks> tareas = tarea_list.map((item) => Tasks.fronJson(item)).toList();
    return User(
      name: json['name'], 
      email: json['email'], 
      taskss: tareas,
    );
  }

  void agregar_tasks(Tasks T) { // agregar la nueva tarea, el parametro es una variable de tipo task
    taskss.add(T);
  }

  void delete_tasks(int id_task) {
    for (int i = taskss.length - 1; i >= 0; i--) {
    if (id_task == taskss[i].id) {
      taskss.removeAt(i);
      break; // Si solo deseas eliminar el primer elemento encontrado, usa break
    }
  }
  }*/
}