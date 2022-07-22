import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_sportivo_fifa/widgets/player_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/team.dart';

class DetailsPage extends StatelessWidget {
  final Team team;

  const DetailsPage({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(team.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * .50,
                width: screenSize.width,
                child: Hero(
                  tag: team.id,
                  child: CachedNetworkImage(
                    imageUrl: team.imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const FaIcon(FontAwesomeIcons.rankingStar),
                  Text('FIFA E-League ${team.location}'),
                ],
              ),
              const SizedBox(height: 8),
              Center(
                child: Text(
                  team.players.isNotEmpty ? 'Jogadores' : '',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: ((_, index) {
                  var player = team.players[index];
                  return PlayerListTile(player: player);
                }),
                itemCount: team.players.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
