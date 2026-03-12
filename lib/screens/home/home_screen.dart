import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/constants/app_colors.dart';
import '../../providers/queue_provider.dart';
import '../../widgets/common/primary_button.dart';
import '../../widgets/components/info_card.dart';
import '../tracking/tracking_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final queueProvider = context.watch<QueueProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('AntreMedika'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome back,',
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 4),
              const Text(
                'Firman Christian',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              
              // Utilizing our reusable InfoCard widget
              InfoCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.primaryLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(Icons.local_hospital, color: AppColors.primary),
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'General Practice',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('Dr. Sarah Smith', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    const Text('Room 38', style: TextStyle(color: AppColors.textSecondary)),
                    const SizedBox(height: 32),
                    
                    // Utilizing our reusable PrimaryButton widget
                    PrimaryButton(
                      label: 'Take Queue Number',
                      isLoading: queueProvider.isLoading,
                      onPressed: () async {
                        await context.read<QueueProvider>().takeNewQueue();
                        if (context.mounted) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const TrackingScreen()),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}