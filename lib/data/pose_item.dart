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

class CameraReq {
  final int poseIdx;
  final int scaleX;
  final int scaleY;
  final List<PoseListItem> poseList;

  CameraReq(
      {required this.poseIdx,
      required this.scaleX,
      required this.scaleY,
      required this.poseList});

  Map<String, dynamic> toJson() {
    return {
      'poseIdx': poseIdx,
      'poseList': poseList.map((poseData) => poseData.toJson()).toList(),
    };
  }
}

class PoseListItem {
  final int pOrder;
  final List<PoseData> poseList;
  final String time;

  PoseListItem({
    required this.pOrder,
    required this.poseList,
    required this.time,
  });

  factory PoseListItem.fromJson(Map<String, dynamic> json) {
    List<dynamic> poseListJson = json['poseList'];
    List<PoseData> poseList =
        poseListJson.map((poseJson) => PoseData.fromJson(poseJson)).toList();

    return PoseListItem(
      pOrder: json['p_order'],
      poseList: poseList,
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'p_order': pOrder,
      'pose': poseList.map((poseData) => poseData.toJson()).toList(),
      'time': time,
    };
  }
}

class PoseData {
  final String position;
  final double reliability;
  final double x;
  final double y;
  final double z;

  PoseData({
    required this.position,
    required this.reliability,
    required this.x,
    required this.y,
    required this.z,
  });

  Map<String, dynamic> toJson() {
    return {
      'position': position,
      'reliability': reliability,
      'x': x,
      'y': y,
      'z': z,
    };
  }

  factory PoseData.fromJson(Map<String, dynamic> json) {
    return PoseData(
      position: json['position'],
      reliability: json['reliability'],
      x: json['x'],
      y: json['y'],
      z: json['z'],
    );
  }
}
