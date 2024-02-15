class Response<T> {
  final bool isSuccess;
  final int code;
  final String message;
  final T result;

  Response({
    required this.isSuccess,
    required this.code,
    required this.message,
    required this.result,
  });

  factory Response.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJson) {
    return Response(
      isSuccess: json['isSuccess'],
      code: json['code'],
      message: json['message'],
      result: fromJson(json['result']),
    );
  }
}
