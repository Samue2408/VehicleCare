import 'package:vehicle_care/Core/Dominio/modelos/reviews.dart';
import 'package:vehicle_care/Core/Dominio/modelos/USer.dart';



class U_expert extends User {

  String? work_Addres;
  String? speciliaty;
  DateTime? year_of_experience;
  final List<reviews> reviews;

   U_expert(
    {
      required this.work_Addres,
      required this.year_of_experience,
      required this.speciliaty,
      required this.reviews,
    }
  );

}
