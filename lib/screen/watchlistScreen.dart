import 'package:flutter/material.dart';
import 'package:stock_talks/components/symbolLookupRow.dart';
import 'package:stock_talks/network/models/forum.dart';

class WatchlistScreen extends StatefulWidget {

  const WatchlistScreen();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WatchlistScreenState();
  }

}

class _WatchlistScreenState extends State<WatchlistScreen> {
  final TextEditingController _filter = new TextEditingController();
  List names = new List(); // names we get from API
  List filteredNames = new List(); // names filtered by search text
  Icon _searchIcon = new Icon(Icons.search);

  List<Forum> availableForums = List();
  List<Forum> filteredList;

  @override
  void initState() {
    super.initState();
    fetchAvailableForums();
    filteredList = availableForums;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[500],
          title: TextField(
            controller: _filter,
            onChanged: updateFilter,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            textCapitalization: TextCapitalization.characters,
            decoration: InputDecoration(
                hintText: 'Search by Symbol',
                fillColor: Colors.white,
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: clearText,
                )
            ),
          ),
          leading: _searchIcon
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.black,
        ),
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return SymbolLookupRow(
            forum: filteredList[index]
          );
        },
      )
    );
  }

  void clearText() {
    _filter.clear();
    updateFilter("");
  }

  void updateFilter(String s) {
    setState(() {
      filteredList = availableForums.where((i) => i.name.toLowerCase().contains(s.toLowerCase()) || i.description.toLowerCase().contains(s.toLowerCase())).toList();
    });
  }

  void fetchAvailableForums() {
    // TODO Hookup API
    var _availableForums = List<Forum>.generate(120, (i) => Forum(
      id: "$i",
      name: "TSX$i",
      description: "Toronto Stock Exchange $i",
      image: "https://picsum.photos/id/$i/50/50/",
      latestPosts: null,
      numberOfPosts: i,
      numberOfFollowers: i*3,
      following: i == 2
    ));

    setState(() {
      availableForums = _availableForums;
    });
  }
}