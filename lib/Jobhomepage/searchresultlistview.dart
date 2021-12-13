import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchResultsListView extends StatelessWidget {
  final String? searchTerm;

  const SearchResultsListView({
    required Key key,
    required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search,
              size: 64,
            ),
            Text(
              'Start searching',
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      );
    }
    final fsb = FloatingSearchBar.of(context);

      return ListView(
        padding: EdgeInsets.fromLTRB(10,40,10,10),
        children: List.generate(
          5,
          (index) => ListTile(
            title: Text('$searchTerm search result'),
            subtitle: Text(index.toString()),
          ),
        ),
      );
  }
}
