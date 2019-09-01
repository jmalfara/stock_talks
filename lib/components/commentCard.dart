import 'package:flutter/material.dart';
import 'package:stock_talks/network/models/comment.dart';

class CommentCard extends StatelessWidget {
  final Comment comment;
  final Function onUpVote;
  final Function onDownVote;
  final Function onReply;

  const CommentCard({Key key, this.comment, this.onUpVote, this.onDownVote, this.onReply}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${comment.username} - ${comment.timestamp}",
              style: TextStyle(color: Colors.grey[500])
            ),
            Text(comment.comment),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_upward),
                      onPressed: () => onUpVote(comment),
                    ),
                    Text("${comment.numberOfVotes}"),
                    IconButton(
                      icon: Icon(Icons.arrow_downward),
                      onPressed: () => onDownVote(comment),
                    ),
                  ],
                ),
                Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Text("${comment.replies.length}"),
                      ),
                      IconButton(
                        icon: Icon(Icons.reply),
                        onPressed: () => onReply(comment),
                      ),
                    ]
                )
              ],
            ),
            Container(
              decoration: new BoxDecoration(
                  border: new Border(
                      left: BorderSide(color: Colors.grey[400])
                  )
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Column (
                children: renderReplies(),
              ),
            )
          ],
        ),
      )
    );
  }

  List<Widget> renderReplies() {
    List<Widget> replyCards = List();

    for (Comment reply in comment.replies) {
      replyCards.add(CommentCard(
          comment: reply,
          onDownVote: onDownVote,
          onUpVote: onUpVote,
          onReply: onReply
      ));
    }

    return replyCards;
  }


}