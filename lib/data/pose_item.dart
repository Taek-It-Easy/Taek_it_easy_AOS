class PoseItem {
  final int poseIdx;
  final String poseName;
  final String? url;

  PoseItem({required this.poseIdx, required this.poseName, this.url});

  factory PoseItem.fromJson(Map<String, dynamic> json) {
    return PoseItem(
      poseIdx: json['poseIdx'] as int,
      poseName: json['poseName'] as String,
      url: json['url'] as String?,
    );
  }
}
