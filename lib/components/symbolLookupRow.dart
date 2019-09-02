import 'package:flutter/material.dart';
import 'package:stock_talks/network/models/forum.dart';

class SymbolLookupRow extends StatelessWidget {
  final Forum forum;
  final Function onPressed;

  const SymbolLookupRow({Key key, this.forum, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(forum.name),
              Text(forum.description)
            ],
          ),
          IconButton(
            icon: Icon(forum.following ? Icons.favorite : Icons.favorite_border),
            onPressed: onPressed,
          )
        ],
      )
    );
  }

}