class PaymentModel {
  final int id;
  final String status;
  final double amount;
  final DateTime createdDate;

  PaymentModel({
    required this.id,
    required this.status,
    required this.amount,
    required this.createdDate,
  });

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> dateData = json['createdDate'];
    DateTime date = DateTime(
      dateData[0],
      dateData[1],
      dateData[2],
      dateData[3],
      dateData[4],
      dateData[5],
      dateData[6],
    );

    return PaymentModel(
      id: json['id'],
      status: json['status'],
      amount: json['amount'].toDouble(),
      createdDate: date,
    );
  }
}
