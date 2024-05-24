class ServiceCenters {
  final int id;
  final String name;
  final String adress;
  final String image;

  ServiceCenters(
      {required this.id,
      required this.name,
      required this.adress,
      required this.image});

  factory ServiceCenters.FromJson(Map<String, dynamic> json) {
    return ServiceCenters(
        id: json['id'],
        name: json['name'],
        adress: json['adress'],
        image: json['image']);
  }
}
