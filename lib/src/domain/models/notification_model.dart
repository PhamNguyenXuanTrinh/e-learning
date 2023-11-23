class NotificationResponseModel {
  const NotificationResponseModel({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  final int? status;
  final int error;
  final String? message;
  final List<NotificationModel>? data;

  factory NotificationResponseModel.fromJson(Map<String, dynamic> json) {
    return NotificationResponseModel(
      status: json['status'] as int?,
      error: json['error'] as int,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NotificationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class NotificationModel {
  final int id;
  final String content;
  final String time;
  final String imageUrl;

  NotificationModel({
    required this.id,
    required this.content,
    required this.time,
    required this.imageUrl,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as int,
      content: json['content'] as String,
      time: json['time'] as String,
      imageUrl: json['image_url'] as String,
    );
  }
}
