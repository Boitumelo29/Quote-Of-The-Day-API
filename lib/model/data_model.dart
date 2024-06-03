class DataModel {
  final int id;
  final String author;
  final String body;
  final int upvotesCount;
  final int downvotesCount;
  final bool favorite;

  DataModel(
      {required this.id,
      required this.author,
      required this.body,
      required this.upvotesCount,
      required this.downvotesCount,
      required this.favorite});

  factory DataModel.fromJson(Map<String, dynamic> json) {
    var quoteJson = json['quote'];
    var userDetails = quoteJson['user_details'] ?? {};
    return DataModel(
        id: quoteJson['id'],
        author: quoteJson["author"],
        body: quoteJson["body"],
        upvotesCount: quoteJson["upvotes_count"],
        downvotesCount: quoteJson["downvotes_count"],
        favorite: userDetails['favorite'] ?? false);
  }
}

class UserModel {
  final String username;
  final String email;
  final String password;

  UserModel(
      {required this.username, required this.email, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    var user = json['user'];
    return UserModel(
        username: user['login'],
        email: user['email'],
        password: user['password']);
  }
}
