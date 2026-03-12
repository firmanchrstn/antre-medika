import 'package:flutter/material.dart';
import '../models/queue_model.dart';
import '../services/queue_service.dart';
import '../core/utils/queuing_math.dart';

// The 'ViewModel' or 'Provider' that bridges data and UI.
// It holds the state and notifies the UI when data changes.
class QueueProvider extends ChangeNotifier {
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
    _setLoading(true);

    _myQueue = await _service.takeQueue();
    _currentServing = await _service.getCurrentServing();
    _calculateWaitTime();

    _setLoading(false);
  }

  Future<void> refreshStatus() async {
    if (_myQueue == null) return;
    
    _setLoading(true);
    _currentServing = await _service.getCurrentServing();
    _calculateWaitTime();
    _setLoading(false);
  }

  void _calculateWaitTime() {
    if (_myQueue != null) {
      _estimatedWaitTime = QueuingMath.calculateEstimatedWaitTime(
        currentServing: _currentServing,
        userNumber: _myQueue!.number,
        avgServiceTimeMinutes: 15, // Average mu (μ) derived from clinical data
      );
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners(); // Tells the UI to rebuild
  }
}