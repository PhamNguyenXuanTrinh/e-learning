class MessageResponseModel {
  const MessageResponseModel(
    this.status,
    this.error,
    this.message,
    this.data,
  );
  final int? status;
  final int error;
  final String? message;
  final List<MessageModel>? data;

  factory MessageResponseModel.fromJson(Map<String, dynamic> json) {
    return MessageResponseModel(
      json['status'] as int,
      json['error'] as int,
      json['message'] as String,
      (json['data'] as List<dynamic>)
          .map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class MessageModel {
  final int id;
  final String? name;
  final String? time;
  final String? status;
  final String? img_url;
  final String? des;
  final String? img_user;

  MessageModel(
      {required this.id,
      required this.name,
      required this.time,
      required this.status,
      required this.img_url,
      required this.des,
      required this.img_user});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json["id"] as int,
      name: json["name"] as String?,
      time: json["time"] as String?,
      status: json["status"] as String?,
      img_url: json["image_url"] as String?,
      des: json["des"] as String?,
      img_user: json["img_user"] as String?,
    );
  }
}
