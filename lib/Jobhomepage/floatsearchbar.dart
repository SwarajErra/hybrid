import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hybrid/Jobhomepage/SearchResutPage.dart';
import 'package:hybrid/Jobhomepage/searchresultlistview.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class FloatSearchBar extends StatefulWidget {
  const FloatSearchBar({Key? key}) : super(key: key);

  @override
  FloatSearchBarState createState() => FloatSearchBarState();
}

class FloatSearchBarState extends State<FloatSearchBar>
    with WidgetsBindingObserver {
  Map<String, dynamic>? userMap;
  late FloatingSearchBarController controller;
  static const historyLength = 4;

  @override
  void initState() {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

// The currently searched-for term
  String selectedTerm = "";

// The "raw" history that we don't access from the UI, prefilled with values
  List<String> _searchHistory = [
    'Any',
    'Information Technology',
    'general labour',
  ];

  late List<String> filteredSearchHistory;

  List<String> filterSearchTerms({
    String? filter,
  }) {
    if (filter != null && filter.isNotEmpty) {
      // Reversed because we want the last added items to appear first in the UI
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      // This method will be implemented soon
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }
    // Changes in _searchHistory mean that we have to update the filteredSearchHistory
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  bool isLoading = true;

  void onSearch() async {
    setState(() {
      isLoading = true;
    });
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    await _firestore
        .collection("PostJob")
        .where("jobType", isEqualTo: selectedTerm)
        .get()
        .then((value) {
      setState(() {
        userMap = value.docs[0].data();
        isLoading = false;
      });
      print(userMap);

    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingSearchBar(
      shadowColor: Colors.black,
      elevation: 5,
      automaticallyImplyBackButton: false,
      controller: controller,
      body: FloatingSearchBarScrollNotifier(
        child: SearchResultsListView(
          searchTerm: selectedTerm,
          key: UniqueKey(),
        ),
      ),
      automaticallyImplyDrawerHamburger: false,
      transition: CircularFloatingSearchBarTransition(),
      // Bouncing physics for the search history
      physics: BouncingScrollPhysics(),
      // Title is displayed on an unopened (inactive) search bar
      title: Text(
        selectedTerm,
        style: Theme.of(context).textTheme.headline6,
      ),
      // Hint gets displayed once the search bar is tapped and opened
      hint: 'Find future jobs...',
      actions: [
        //action is ude to clear seacrh bar
        FloatingSearchBarAction.searchToClear(),
      ],
      onQueryChanged: (query) {
        setState(() {
          filteredSearchHistory = filterSearchTerms(filter: query);
        });
      },
      onSubmitted: (query) {
        setState(() {
          addSearchTerm(query);
          selectedTerm = query;
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => searchresultPage( selectedTerm: selectedTerm,key: UniqueKey())));
        });
        controller.close();
      },

      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            //color: Colors.white,
            elevation: 4,
            child: Builder(
              builder: (context) {
                if (filteredSearchHistory.isEmpty && controller.query.isEmpty) {
                  return Container(
                    height: 56,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      'Search jobs',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  );
                } else if (filteredSearchHistory.isEmpty) {
                  return ListTile(
                    title: Text(controller.query),
                    leading: const Icon(Icons.search),
                    onTap: () {
                      setState(() {
                        addSearchTerm(controller.query);
                        selectedTerm = controller.query;

                      });
                      controller.close();
                    },
                  );
                } else {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: filteredSearchHistory
                        .map(
                          (term) => ListTile(
                            title: Text(
                              term,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            //  leading: const Icon(Icons.search),
                            trailing: IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                setState(() {
                                  deleteSearchTerm(term);
                                });
                              },
                            ),
                            onTap: () {
                              // This on tap resposible for searching the iteams
                              setState(() {
                                putSearchTermFirst(term);
                                selectedTerm = term;
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => searchresultPage( selectedTerm: selectedTerm,key: UniqueKey())));
                              });
                              controller.close();
                            },
                          ),
                        )
                        .toList(),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
