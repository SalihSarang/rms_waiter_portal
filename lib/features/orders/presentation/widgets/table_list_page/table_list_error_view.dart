import 'package:flutter/material.dart';
import 'package:rms_design_system/rms_design_system.dart';

class TableListErrorView extends StatelessWidget {
  final String message;

  const TableListErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline_rounded,
              color: SemanticColors.error,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              'Error: $message',
              textAlign: TextAlign.center,
              style: const TextStyle(color: SemanticColors.error, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
