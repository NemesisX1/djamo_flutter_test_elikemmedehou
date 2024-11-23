import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AddTodoBottomSheet extends StatelessWidget {
  AddTodoBottomSheet({super.key});

  final _formKey = GlobalKey<FormState>();
  final _titleTextController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.close,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            const Gap(5),
            Text(
              'Nouvelle tâche',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
        Gap(10),
        Form(
          child: Wrap(
            children: [],
          ),
        )
      ],
    );
  }
}
