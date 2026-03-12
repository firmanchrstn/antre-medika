import '../models/queue_model.dart';

// Simulates external API/Firebase calls.
// In production, this file connects to Firestore.
class QueueService {
  int _currentNumber = 10;
  int _latestAssignedNumber = 14;

  Future<QueueModel> takeQueue() async {
    // Simulating network delay
    await Future.delayed(const Duration(seconds: 1));
    _latestAssignedNumber++;
    
    return QueueModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      number: _latestAssignedNumber,
      requestTime: DateTime.now(),
      status: 'waiting',
    );
  }

  Future<int> getCurrentServing() async {
    await Future.delayed(const Duration(milliseconds: 500));
    _currentNumber++;
    return _currentNumber;
  }
}