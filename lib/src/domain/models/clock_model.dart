class ClockResponseModel {
  const ClockResponseModel(
    this.status,
    this.error,
    this.message,
    this.data,
  );
  final int? status;
  final int error;
  final String? message;
  final ClockModel? data;

  factory ClockResponseModel.fromJson(Map<String, dynamic> json) {
    return ClockResponseModel(
      json['status'] as int,
      json['error'] as int,
      json['message'] as String,
      ClockModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}

class ClockModel {
  final int id;
  final int learned;
  final int totalHours;
  final int totalDay;
  final int week;
  ClockModel({
    required this.id,
    required this.learned,
    required this.totalHours,
    required this.totalDay,
    required this.week,
  });

   factory ClockModel.fromJson(Map<String, dynamic> json) {
    return ClockModel(
      id: json['id'] as int,
      learned: json['learned'] as int,
      totalHours: json['totalHours'] as int,
      totalDay: json['totalDay'] as int,
      week: json['week'] as int,
    );
  }

}
