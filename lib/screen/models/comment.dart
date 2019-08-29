class Comment {
  final String id;
  final String username;
  final String timestamp;
  final String comment;
  final int numberOfVotes;
  final List<Comment> replies;

  Comment({this.id, this.username, this.timestamp, this.comment, this.numberOfVotes, this.replies});
}