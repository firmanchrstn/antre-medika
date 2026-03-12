import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/queue_provider.dart';
import '../../widgets/components/info_card.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<QueueProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Queue'),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator(color: AppColors.primary))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'YOUR POSITION',
                    style: TextStyle(fontSize: 13, color: AppColors.textSecondary, letterSpacing: 1.5, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Klinik Pratama',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 48),
                  
                  // Central highlighted queue number
                  _buildQueueCircle(provider.myQueue?.number.toString() ?? '-'),
                  const SizedBox(height: 40),
                  
                  // Estimated wait time badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.primaryLight,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Estimated Wait: ~${provider.estimatedWaitTime} mins',
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.primary),
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  // Current serving status card
                  InfoCard(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Currently Serving', style: TextStyle(fontSize: 13, color: AppColors.textSecondary)),
                            const SizedBox(height: 4),
                            Text(
                              'Ticket No. ${provider.currentServing}',
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Icon(Icons.notifications_active, color: AppColors.primary, size: 28),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  TextButton.icon(
                    onPressed: () => context.read<QueueProvider>().refreshStatus(),
                    icon: const Icon(Icons.refresh, color: AppColors.primary),
                    label: const Text('Refresh Status', style: TextStyle(color: AppColors.primary, fontSize: 16, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
    );
  }

  // Extracted widget method to keep the build function clean
  Widget _buildQueueCircle(String number) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: AppColors.cardWhite,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.15),
            blurRadius: 32,
            spreadRadius: 8,
            offset: const Offset(0, 12),
          )
        ],
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold, color: AppColors.primary),
        ),
      ),
    );
  }
}