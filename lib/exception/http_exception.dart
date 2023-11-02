class HttpException implements Exception {
  final String msg;
  final int statudCode;

  HttpException({
    required this.msg,
    required this.statudCode,
  });

  @override
  String toString() {
    return msg;
  }
}
