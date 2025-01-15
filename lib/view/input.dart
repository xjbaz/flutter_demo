import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_demo_app/shared_preferences.dart';

class InputPage extends ConsumerWidget {
  const InputPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final providerNotifier = ref.watch(sharedPrefTestProvider.notifier);
    final messageController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: messageController,
            decoration: const InputDecoration(
              hintText: '値を入力',
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final msg = messageController.text.trim();
              if (msg.isEmpty) return;

              providerNotifier
                ..setName(ref, PrefKey.value1, msg)
                ..getName(ref, PrefKey.value1);

              messageController.clear();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('保存しました')),
              );
            },
            child: const Text('変更'),
          ),
        ],
      ),
    );
  }
}
