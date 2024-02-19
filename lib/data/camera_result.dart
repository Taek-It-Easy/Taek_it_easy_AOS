class CameraResultItem {
  final double cdavg;
  final double cdmax;
  final int poder;
  final int poseSeq;

  CameraResultItem({
    required this.cdavg,
    required this.cdmax,
    required this.poder,
    required this.poseSeq,
  });

  factory CameraResultItem.fromJson(Map<String, dynamic> json) {
    return CameraResultItem(
      poder: json['poder'],
      poseSeq: json['poseSeq'],
      cdavg: json['cdavg'],
      cdmax: json['cdmax'],
    );
  }
}

class CameraResult {
  final List<CameraResultItem> cameraResult;

  CameraResult({required this.cameraResult});

  factory CameraResult.fromJson(Map<String, dynamic> json) {
    final List<dynamic> cameraResultJson = json['cameraResult'];
    List<CameraResultItem> cameraResultList = cameraResultJson
        .map((result) => CameraResultItem.fromJson(result))
        .toList();

    return CameraResult(cameraResult: cameraResultList);
  }
}
