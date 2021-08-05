class AppsList {
  int id;
  String name;

  AppsList(this.id, this.name);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic> {
      'id': id,
      'name': name,
    };
    return map;
  }

  AppsList.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }
}