class PaymentResponseModel {
  const PaymentResponseModel({
    required this.status,
    required this.error,
    required this.message,
    required this.data,
  });

  final int? status;
  final int error;
  final String? message;
  final PaymentModel? data;

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      status: json['status'] as int?,
      error: json['error'] as int,
      message: json['message'] as String?,
      data: json['data'] != null
          ? PaymentModel.fromJson(json['data'] as Map<String, dynamic>)
          : null,
    );
  }
}

class PaymentModel {
  int? id;
  int? moneyCourse;
  int? bankCard;
  String? buttonPay;
  String? contentCourse;

  PaymentModel({
    this.id,
    this.moneyCourse,
    this.bankCard,
    this.buttonPay,
    this.contentCourse,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      id: json['id'] as int?,
      moneyCourse: json['moneyCourse'] as int?,
      bankCard: json['bankCard'] as int?,
      buttonPay: json['buttonPay'] as String?,
      contentCourse: json['contentCourse'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['moneyCourse'] = moneyCourse;
    data['bankCard'] = bankCard;
    data['buttonPay'] = buttonPay;
    data['contentCourse'] = contentCourse;
    return data;
  }
}
