import 'package:flutter/material.dart';
import 'package:stock_talks/components/circleImage.dart';
import 'package:stock_talks/network/models/forum.dart';
import 'package:stock_talks/network/models/post.dart';

class FeedItemTile extends StatelessWidget {
  final Forum forum;
  final Post item;
  final Function onUpVote;
  final Function onDownVote;
  final Function onShare;
  final Function onPressed;

  final bool fullDescription;

  const FeedItemTile({Key key,
    this.forum,
    this.item,
    this.onUpVote,
    this.onDownVote,
    this.onShare,
    this.onPressed,
    this.fullDescription = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onPressed(item),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
              children: <Widget>[
                // Group Icon and Forum Title
                Row(
                  children: <Widget>[
                    CircleImage(size: 30, imageUrl: forum.image),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                    Text(forum.id)
                  ],
                ),
                // Post Title
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          item.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20
                          ),
                        )
                    )
                  ],
                ),
                // Post Description
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            item.description,
                            maxLines: fullDescription ? null : 4,
                            overflow: TextOverflow.fade,
                            style: TextStyle(
                                fontWeight: FontWeight.normal
                            ),
                          )
                      ),
                    )
                  ],
                ),
                // Votes / Comments and Share Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.arrow_upward),
                          onPressed: () => onUpVote(item),
                        ),
                        Text("${item.numberOfUpVotes}"),
                        IconButton(
                          icon: Icon(Icons.arrow_downward),
                          onPressed: () => onDownVote(item),
                        ),
                      ],
                    ),
                    Row(
                        children: <Widget>[
                          Icon(Icons.comment),
                          Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text("${item.numberOfComments}"),
                          )
                        ]
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () => onShare(item),
                    )
                  ],
                )
              ]
          ),
        ),
      )
    );
  }
}