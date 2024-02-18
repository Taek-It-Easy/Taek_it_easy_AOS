class CameraResult {
  final int cdavg;
  final int cdmax;
  final int poder;
  final int poseSeq;

  CameraResult({
    required this.cdavg,
    required this.cdmax,
    required this.poder,
    required this.poseSeq,
  });

  factory CameraResult.fromJson(Map<String, dynamic> json) {
    return CameraResult(
      cdavg: json['cdavg'],
      cdmax: json['cdmax'],
      poder: json['poder'],
      poseSeq: json['poseSeq'],
    );
  }
}
