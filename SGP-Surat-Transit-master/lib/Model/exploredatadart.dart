class ExploreSurat {
  int? id;
  String? name;
  String? image;
  String? data;
  String? address;

  ExploreSurat({this.id, this.name, this.image, this.data});

  ExploreSurat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    data = json['data'];
    address = json['address'];
  }
}
