class UserContent {
  final int poomsaeIdx;
  final int poseIdx;
  final int userIdx;

  UserContent({
    required this.poomsaeIdx,
    required this.poseIdx,
    required this.userIdx,
  });

  factory UserContent.fromJson(Map<String, dynamic> json) {
    return UserContent(
      poomsaeIdx: json['poomsaeIdx'] as int,
      poseIdx: json['poseIdx'] as int,
      userIdx: json['userIdx'] as int,
    );
  }
}
