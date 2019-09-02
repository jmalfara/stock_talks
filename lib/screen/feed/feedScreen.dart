/*
 * Feed Screen
 * This screen is responsible for displaying the users feed for followed stock posts
 * Also for finding stocks to follow
 * */

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:stock_talks/network/models/forum.dart';
import 'package:stock_talks/network/models/post.dart';
import 'package:stock_talks/components/feedItemTile.dart';
import 'package:stock_talks/screen/post/postScreen.dart';

class FeedScreen extends StatefulWidget {

  const FeedScreen();

  @override
  State<StatefulWidget> createState() {
    return _FeedScreen();
  }
}

class _FeedScreen extends State<FeedScreen> {
  List<Post> posts = List();
  final HashMap<Post, Forum> forumLookupTable = HashMap();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Fetch");
    fetchFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return FeedItemTile(
            item: posts[index],
            forum: forumLookupTable[posts[index]],
            onUpVote: upVote,
            onDownVote: downVote,
            onShare: share,
            onPressed: launchPostScreen,
          );
        },
      )
    );
  }

  void fetchFeed() {
    // Fetch the list of subscribed Forums
    // TODO API Call

    // Fetch the the list of forums
    // TODO API Call
    final forums = List<Forum>.generate(200, (i) => Forum(
        id: "$i",
        name: "TSX$i",
        description: "Toronto Stock Extange $i",
        image: "https://picsum.photos/id/$i/50/50/",
        latestPosts: List<Post>.generate(5, (j) => Post(
            id: "${j*i}",
            title: "Message body ${j*i}",
            description: "Description: DescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescriptionDescription DescriptionDescriptionDescriptionDescriptionDescriptionDescription DescriptionDescription$i",
            numberOfUpVotes: i*126,
            numberOfComments: i*22
          )
        )
      )
    );

    final _posts = List<Post>();

    forums.forEach((forum) => {
      forum.latestPosts.forEach((post) {
        _posts.add(post);
        forumLookupTable[post] = forum;
      })
    });
    // TODO Sort post list based on Timestamp

    print(_posts.length);

    setState(() {
      posts = _posts;
    });
  }

  void upVote(Post item) {
    // TODO Hookup API
    print("UpVote: " + item.title);
  }

  void downVote(Post item) {
    // TODO Hookup API
    print("DownVote: " + item.title);
  }

  void share(Post item) {
    // TODO Hookup API
    print("Share: " + item.title);
  }

  void launchPostScreen(Post item) {
    print("Launch Post: " + item.id);
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PostScreen(postItem: item, forum: forumLookupTable[item]))
    );
  }
}