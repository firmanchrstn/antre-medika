class QueuingMath {
  // Core business logic implementing the M/M/1 Queuing Theory estimate.
  // Isolated here so it can be tested independently of the UI.
  static int calculateEstimatedWaitTime({
    required int currentServing, 
    required int userNumber, 
    required int avgServiceTimeMinutes,
  }) {
    if (userNumber <= currentServing) return 0;
    
    int peopleAhead = userNumber - currentServing;
    return peopleAhead * avgServiceTimeMinutes;
  }
}