class PoseItem {
  final int poseIdx;
  final String poseName;

  PoseItem({
    required this.poseIdx,
    required this.poseName,
  });

  factory PoseItem.fromJson(Map<String, dynamic> json) {
    return PoseItem(
      poseIdx: json['poseIdx'] as int,
      poseName: json['poseName'] as String,
    );
  }
}
