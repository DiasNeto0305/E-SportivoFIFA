import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:e_sportivo_fifa/models/team.dart';
import 'package:e_sportivo_fifa/pages/details_page.dart';

class CustomListCard extends StatelessWidget {
  final Team team;

  const CustomListCard({Key? key, required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsPage(team: team),
              fullscreenDialog: true,
            ),
          );
        },
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Hero(
                  tag: team.id,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: CachedNetworkImage(
                      imageUrl: team.imageUrl,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        team.name,
                        style: Theme.of(context).textTheme.headline6,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          const Icon(Icons.gamepad),
                          const SizedBox(
                            width: 8,
                          ),
                          Text("FIFA E-League ${team.location}"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
