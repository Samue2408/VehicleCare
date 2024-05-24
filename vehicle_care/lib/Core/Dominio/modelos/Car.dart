class Car {
  final int id;
  final String brand;
  final String model;
  final DateTime year;
  final double mileage;
  final String type_of_file;
  final String file_image ;


  Car(
    {
      required this.id,
      required this.brand,
      required this.model,
      required this.year,
      required this.mileage,
      required this.type_of_file,
      required this.file_image,
    }
  );

  factory Car.fromJson(Map<String, dynamic> json){
    return Car(
      id: json['id'], 
      brand: json['brand'], 
      model: json['model'], 
      year: json['year'], 
      mileage: json['mileage'], 
      type_of_file: json['type_of_file'], 
      file_image: json['file_image']);
  }

}