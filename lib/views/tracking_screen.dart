import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/queue_viewmodel.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<QueueViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Live Queue', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator(color: Colors.blue))
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('YOUR POSITION', style: TextStyle(fontSize: 14, color: Colors.grey, letterSpacing: 1.5)),
                  const SizedBox(height: 10),
                  const Text('Klinik Pratama JIU', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 40),
                  Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.blue.withOpacity(0.15),
                          blurRadius: 30,
                          spreadRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        viewModel.myQueue?.number.toString() ?? '-',
                        style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Wait: ~${viewModel.estimatedWaitTime} mins',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Currently Serving', style: TextStyle(fontSize: 12, color: Colors.grey)),
                            Text('Ticket No. ${viewModel.currentServing}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Icon(Icons.notifications_active, color: Colors.blue),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  TextButton.icon(
                    onPressed: () => context.read<QueueViewModel>().refreshStatus(),
                    icon: const Icon(Icons.refresh, color: Colors.blue),
                    label: const Text('Refresh Status', style: TextStyle(color: Colors.blue, fontSize: 16)),
                  ),
                ],
              ),
            ),
    );
  }
}