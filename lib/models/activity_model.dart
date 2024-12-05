enum ActivityStatus { ongoing, done }

class Activity {
  String? id;
  String name;
  String image;
  String city;
  double price;
  ActivityStatus status;

  Activity({
    this.id,
    required this.name,
    required this.image,
    required this.city,
    required this.price,
  }): status = ActivityStatus.ongoing;
}