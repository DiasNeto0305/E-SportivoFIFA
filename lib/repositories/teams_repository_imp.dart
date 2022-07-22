import 'package:e_sportivo_fifa/models/team.dart';
import 'package:e_sportivo_fifa/repositories/teams_repository.dart';
import 'package:e_sportivo_fifa/services/dio_service.dart';
import 'package:e_sportivo_fifa/utils/api_utils.dart';

class TeamsRepositoryImp implements TeamsRepository {
  final DioService _dioService;

  TeamsRepositoryImp(this._dioService);

  @override
  Future<List<Team>> getTeams() async {
    List<Team> teamsList = [];
    var result =
        await _dioService.getDio().get(API.REQUEST_TEAM_LIST);
    result.data.forEach((teamJson) {
      if (teamJson['image_url'] != null && teamJson['players'] != null) {
        var team = Team.fromJson(teamJson);
        teamsList.add(team);
      }
    });
    return teamsList;
  }
}
