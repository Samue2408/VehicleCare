// ignore_for_file: camel_case_types, non_constant_identifier_names, use_super_parameters

class Solutions{
  final int id;
  final String description;

  Solutions({
    required this.id,
    required this.description,
  });


  factory Solutions.fromJson(Map<String, dynamic> json) {
    return Solutions(
        id: json['id'],
        description: json['description'],
      );
  }

}
