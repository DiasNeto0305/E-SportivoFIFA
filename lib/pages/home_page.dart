import 'package:flutter/material.dart';
import 'package:e_sportivo_fifa/controllers/team_controller.dart';
import 'package:e_sportivo_fifa/models/team.dart';
import 'package:e_sportivo_fifa/repositories/teams_repository_imp.dart';
import 'package:e_sportivo_fifa/services/dio_service_imp.dart';
import '../data_search/custom_search_delegate.dart';
import '../widgets/custom_list_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TeamController _controller = TeamController(
    (TeamsRepositoryImp(
      DioServiceImp(),
    )),
  );

  @override
  Widget build(BuildContext context) {
    final teamsList = _controller.teams;
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Text('E-Sportivo FIFA'),
            SizedBox(
              width: 8,
            ),
            Icon(Icons.videogame_asset),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(teamsList.value),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Equipes',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 8,
              ),
              ValueListenableBuilder<List<Team>>(
                valueListenable: teamsList,
                builder: (_, teams, __) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: teams.length,
                    itemBuilder: (_, index) =>
                        CustomListCard(team: teams[index]),
                    separatorBuilder: (_, __) => const Divider(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
