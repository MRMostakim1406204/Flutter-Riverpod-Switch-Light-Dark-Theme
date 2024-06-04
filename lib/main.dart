import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<bool>((ref) => false);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return MaterialApp(
      theme: isLightTheme ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const PracticeEleven(),
    );
  }
}

class PracticeEleven extends ConsumerWidget {
  const PracticeEleven({super.key});

  Widget build(BuildContext context, WidgetRef ref) {
    final isLightTheme = ref.watch(themeProvider);
    return Scaffold(
      body: Center(
        child: Switch(
            value: isLightTheme,
            onChanged: (value) {
              ref.read(themeProvider.notifier).state = value;
            }),
      ),
    );
  }
}
