import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/queue_provider.dart';
import 'screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AntreMedikaApp());
}

class AntreMedikaApp extends StatelessWidget {
  const AntreMedikaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider sits at the root to inject dependencies downward
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QueueProvider()),
      ],
      child: MaterialApp(
        title: 'AntreMedika',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme, // Using our centralized theme
        home: const HomeScreen(),
      ),
    );
  }
}