import 'package:flutter/material.dart';
import 'package:stock_talks/components/symbolLookupRow.dart';
import 'package:stock_talks/network/models/symbol.dart';

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

  // TODO Hookup API
  List<Symbol> symbols = List<Symbol>.generate(
      1200,
          (i) => Symbol(
          id: "TSX$i",
          company: "Toronto Ex: $i"
      )
  );

  List<Symbol> filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = symbols;
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
      body: ListView.builder(
        itemCount: filteredList.length,
        itemBuilder: (context, index) {
          return SymbolLookupRow(
            symbol: filteredList[index]
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
      filteredList = symbols.where((i) => i.id.contains(s)).toList();
    });
  }
}