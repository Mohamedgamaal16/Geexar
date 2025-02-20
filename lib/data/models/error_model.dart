class ApiError {
  final String status;
  final String code;
  final String message;

  ApiError({
    required this.status,
    required this.code,
    required this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic> json) {
    return ApiError(
      status: json['status'] ?? '',
      code: json['code'] ?? '',
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'code': code,
      'message': message,
    };
  }

  @override
  String toString() {
    return 'ApiError(status: $status, code: $code, message: $message)';
  }
}
