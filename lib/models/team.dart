import 'package:e_sportivo_fifa/models/player.dart';

class Team {
  Team({
    required this.id,
    required this.imageUrl,
    required this.location,
    required this.modifiedAt,
    required this.name,
    required this.players
  });
  late final int id;
  late final String imageUrl;
  late final String location;
  late final String modifiedAt;
  late final String name;
  late final List<Player> players;
  
  Team.fromJson(Map<String, dynamic> json){
    List<Player> playersList = [];
    id = json['id'];
    imageUrl = json['image_url'];
    location = json['location'];
    modifiedAt = json['modified_at'];
    name = json['name'];
    json['players'].forEach((playerJson) {
      var player = Player.fromJson(playerJson);
      playersList.add(player);
    });
    players = playersList;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image_url'] = imageUrl;
    _data['location'] = location;
    _data['modified_at'] = modifiedAt;
    _data['name'] = name;
    _data['players'] = players;
    return _data;
  }

  @override
  String toString() {
    return 'Team(id: $id, imageUrl: $imageUrl, location: $location, modifiedAt: $modifiedAt, name: $name)';
  }

  Team copyWith({
    int? id,
    String? imageUrl,
    String? location,
    String? modifiedAt,
    String? name,
    List<Player>? players,
  }) {
    return Team(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      location: location ?? this.location,
      modifiedAt: modifiedAt ?? this.modifiedAt,
      name: name ?? this.name, 
      players: players ?? this.players,
    );
  }
}
