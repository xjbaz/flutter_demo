import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo_app/shared_preferences.dart';

class OutputPage extends ConsumerWidget {
  const OutputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerValue = ref.watch(sharedPrefTestProvider);

    return Center(
      child: Text(
        '現在の値：$providerValue',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
