import 'package:e_sportivo_fifa/models/team.dart';

abstract class TeamsRepository {
  Future<List<Team>> getTeams();
}