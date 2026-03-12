class QueueModel {
  final String id;
  final int number;
  final DateTime requestTime;
  final String status;

  QueueModel({
    required this.id,
    required this.number,
    required this.requestTime,
    required this.status,
  });
}