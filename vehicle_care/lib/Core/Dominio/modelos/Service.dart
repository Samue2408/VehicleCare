class Service {
  final int id;
  final String name;
  final int intervale;


  //constructor
  Service({
    required this.id,
    required this.name,
    required this.intervale
  });


  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'], 
      name: json['name'], 
      intervale: json['intervale'],
      );
  }
}