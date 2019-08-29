/*
 * Post Screen
 * This screen is responsible for displaying a posted item and comment chain
 * */

import 'package:flutter/material.dart';
import 'package:stock_talks/screen/components/commentCard.dart';
import 'package:stock_talks/screen/feed/feedItemTile.dart';
import 'package:stock_talks/screen/models/comment.dart';
import 'package:stock_talks/screen/models/post.dart';

class PostScreen extends StatefulWidget {
  final Post postItem;

  const PostScreen({Key key, this.postItem}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _PostScreenState(postItem: postItem);
  }
}

class _PostScreenState extends State<PostScreen> {
  final Post postItem;
  List<Object> items;

  final replyTextEditingController = TextEditingController();

  _PostScreenState({this.postItem}) {
    items = List();
    items.add(postItem);

    // Reply field
    items.add(Object());

    // TODO Use API to get this data.
    var repliesList2 = List<Comment>();
    repliesList2.add(Comment(username: "HelloMate", timestamp: "20-12-09T10:30", comment: "Kool!", numberOfVotes: 0, replies: List<Comment>()));
    repliesList2.add(Comment(username: "HelloMate", timestamp: "20-12-09T10:30", comment: "Kool Beans!", numberOfVotes: 0, replies: List<Comment>()));

    var repliesList = List<Comment>();
    repliesList.add(Comment(username: "HelloMate", timestamp: "20-12-09T10:30", comment: "Kool!", numberOfVotes: 0, replies: repliesList2));
    repliesList.add(Comment(username: "HelloMate", timestamp: "20-12-09T10:30", comment: "Kool Beans!", numberOfVotes: 0, replies: List<Comment>()));

    items.add(Comment(username: "jmalfara", timestamp: "20-12-09T10:30", comment: "I love this!", numberOfVotes: 1, replies: repliesList));
    items.add(Comment(username: "joeshmo", timestamp: "20-12-09T10:30", comment: "This stock will go back up. Dumb right now", numberOfVotes: 5, replies: List<Comment>()));
    items.add(Comment(username: "blutoon", timestamp: "20-12-09T10:30", comment: "LABS is better than this. just bought 200 shares", numberOfVotes: -5, replies: List<Comment>()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[500],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            // Header.
            return FeedItemTile(
              item: postItem,
              fullDescription: true,
              onPressed: () => {/*No-Op*/},
              onDownVote: downVotePost,
              onUpVote: upVotePost,
              onShare: sharePost
            );
          } else if (index == 1) {
            // Reply edit text
            return Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: replyTextEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Reply',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () => sendReply(),
                    )
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  autocorrect: true,
                  textCapitalization: TextCapitalization.sentences,
                )
            );
          }

          if (items[index] is Comment) {
            Comment comment = items[index];
            return CommentCard(
              comment: comment,
              onUpVote: upVoteComment,
              onDownVote: downVoteComment,
              onReply: replyToComment,
            );
          }
        },
      ),
    );
  }

  void sendReply() {
    // TODO
    print("Send Reply: "+replyTextEditingController.text);
    replyTextEditingController.text = "";
  }

  void upVotePost(Post post) {
    // TODO
    print("UpVote"+post.postId);
  }

  void downVotePost(Post post) {
    // TODO
    print("DownVote"+post.postId);
  }

  void sharePost(Post post) {
    // TODO
    print("Share: "+post.postId);
  }

  // Comments
  void upVoteComment(Comment comment) {
   // TODO
    print("Up Vote Comment "+comment.comment);
  }

  void downVoteComment(Comment comment) {
    // TODO
    print("Down Vote Comment "+comment.comment);
  }

  void replyToComment(Comment comment) {
    // TODO
    print("Reply to Comment: "+comment.comment);
  }
}