class User {
  final int userIdx;

  User({required this.userIdx});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userIdx: json['userIdx'],
    );
  }
}
