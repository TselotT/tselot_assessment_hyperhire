class DatingCardModel {
  String id;
  String name;
  int age;
  List<String> imagesUrl;
  String description;
  String distance;

  DatingCardModel({
    required this.id,
    required this.name,
    required this.age,
    required this.imagesUrl,
    required this.description,
    required this.distance,
  });
}

class InterestModel {
  String interest;
  String? iconUrl;
  String? iconAsset;

  InterestModel({
    required this.interest,
    this.iconUrl,
    this.iconAsset,
  });
}
