import 'package:flutter/material.dart';
import 'package:stock_talks/components/circleImage.dart';
import 'package:stock_talks/network/models/post.dart';

class FeedItemTile extends StatelessWidget {
  final Post item;
  final Function onUpVote;
  final Function onDownVote;
  final Function onShare;
  final Function onPressed;

  final bool fullDescription;

  const FeedItemTile({Key key,
    this.item,
    this.onUpVote,
    this.onDownVote,
    this.onShare,
    this.onPressed,
    this.fullDescription = false
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
                    CircleImage(size: 30, imageUrl: item.forumImage),
                    Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
                    Text(item.forumName)
                  ],
                ),
                // Post Title
                Row(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          item.postTitle,
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
                            item.postDescription,
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
                        Text("${item.numberOfVotes}"),
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