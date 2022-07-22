import 'package:flutter/material.dart';
import 'package:e_sportivo_fifa/models/team.dart';
import 'package:e_sportivo_fifa/widgets/custom_list_card.dart';

class CustomSearchListView extends StatelessWidget {

  final List<Team> teams;

  const CustomSearchListView({Key? key, required this.teams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: teams.length,
              itemBuilder: (_, index) => CustomListCard(team: teams[index]),
              separatorBuilder: (_, __) => const Divider(),
            ),
          ],
        ),
      ),
    );
  }
}
