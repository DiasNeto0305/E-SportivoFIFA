class Player {
  Player({
    required this.age,
    required this.firstName,
    required this.id,
    required this.imageUrl,
    required this.lastName,
    required this.name,
    required this.nationality,
  });
  late final int? age;
  late final String? firstName;
  late final int id;
  late final String? imageUrl;
  late final String? lastName;
  late final String? name;
  late final String? nationality;
  
  Player.fromJson(Map<String, dynamic> json){
    age = json['age'];
    firstName = json['first_name'];
    id = json['id'];
    imageUrl = json['image_url'];
    lastName = json['last_name'];
    name = json['name'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['age'] = age;
    _data['first_name'] = firstName;
    _data['id'] = id;
    _data['image_url'] = imageUrl;
    _data['last_name'] = lastName;
    _data['name'] = name;
    _data['nationality'] = nationality;
    return _data;
  }

  @override
  String toString() {
    return 'Player(age: $age, firstName: $firstName, id: $id, imageUrl: $imageUrl, lastName: $lastName, name: $name, nationality: $nationality)';
  }

  Player copyWith({
    int? age,
    String? firstName,
    int? id,
    String? imageUrl,
    String? lastName,
    String? name,
    String? nationality,
  }) {
    return Player(
      age: age ?? this.age,
      firstName: firstName ?? this.firstName,
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      lastName: lastName ?? this.lastName,
      name: name ?? this.name,
      nationality: nationality ?? this.nationality,
    );
  }
}
