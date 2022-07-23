import 'package:flutter/material.dart';
import 'package:e_sportivo_fifa/models/team.dart';
import 'package:e_sportivo_fifa/widgets/custom_search_list_view.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<Team> teams;

  CustomSearchDelegate(this.teams);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var filterList = teams
        .where(
          (team) => team.toString().toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return CustomSearchListView(teams: filterList);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var filterList = teams
        .where(
          (team) => team.toString().toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return CustomSearchListView(teams: filterList);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    
    return theme;
  }
}
