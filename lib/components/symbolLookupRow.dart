import 'package:flutter/material.dart';
import 'package:stock_talks/network/models/symbol.dart';

class SymbolLookupRow extends StatelessWidget {
  final Symbol symbol;
  final Function onPressed;

  const SymbolLookupRow({Key key, this.symbol, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(symbol.id),
        IconButton(
          icon: Icon(symbol.saved ? Icons.favorite : Icons.favorite_border),
          onPressed: onPressed,
        )
      ],
    );
  }

}