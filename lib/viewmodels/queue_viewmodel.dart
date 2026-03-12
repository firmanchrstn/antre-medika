import 'package:flutter/material.dart';
import '../models/queue_model.dart';
import '../services/queue_service.dart';
import '../utils/queuing_math.dart';

class QueueViewModel extends ChangeNotifier {
  final QueueService _service = QueueService();

  QueueModel? _myQueue;
  QueueModel? get myQueue => _myQueue;

  int _currentServing = 10;
  int get currentServing => _currentServing;

  int _estimatedWaitTime = 0;
  int get estimatedWaitTime => _estimatedWaitTime;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> takeNewQueue() async {
    _isLoading = true;
    notifyListeners();

    _myQueue = await _service.takeQueue();
    _currentServing = await _service.getCurrentServing();
    
    _calculateWaitTime();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> refreshStatus() async {
    if (_myQueue == null) return;
    _isLoading = true;
    notifyListeners();

    _currentServing = await _service.getCurrentServing();
    _calculateWaitTime();

    _isLoading = false;
    notifyListeners();
  }

  void _calculateWaitTime() {
    if (_myQueue != null) {
      _estimatedWaitTime = QueuingMath.calculateEstimatedWaitTime(
        _currentServing,
        _myQueue!.number,
        15, 
      );
    }
  }
}