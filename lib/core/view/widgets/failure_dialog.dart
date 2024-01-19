import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_task_hp_houses/core/domain/entities/failure.dart';
import 'package:test_task_hp_houses/locales/strings.dart';

class FailureDialog extends StatelessWidget {
  final Failure failure;

  const FailureDialog({
    super.key,
    required this.failure,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(failure.name),
      content: failure.description != null ? Text(failure.description!) : null,
      actions: [
        TextButton(
          onPressed: () {
            context.popRoute();
          },
          child: Text(Strings.ok),
        )
      ],
    );
  }
}
