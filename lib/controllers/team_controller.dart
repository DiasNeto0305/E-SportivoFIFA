import 'package:flutter/cupertino.dart';
import 'package:e_sportivo_fifa/models/team.dart';
import 'package:e_sportivo_fifa/repositories/teams_repository.dart';

class TeamController {
  final TeamsRepository _teamsRepository;

  TeamController(this._teamsRepository) {
    fetch();
  }

  ValueNotifier<List<Team>> teams = ValueNotifier<List<Team>>([]);

  fetch() async {
    teams.value = await _teamsRepository.getTeams();
  }
}
