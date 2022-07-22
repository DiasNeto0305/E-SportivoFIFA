// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:e_sportivo_fifa/models/player.dart';

class PlayerListTile extends StatelessWidget {

  final Player player;

  const PlayerListTile({
    Key? key,
    required this.player,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: player.imageUrl != null && player.imageUrl != ''
          ? CircleAvatar(
              minRadius: 16,
              maxRadius: 24,
              backgroundImage: CachedNetworkImageProvider(player.imageUrl!),
            )
          : const Text(''),
      title: Text(
        (player.name ?? '') +
            ' ' +
            (player.age != null ? '${player.age} anos' : ''),
      ),
      subtitle: Text((player.firstName ?? '') + ' ' + (player.lastName ?? '')),
      trailing: Text((player.nationality ?? '')),
    );
  }
}
