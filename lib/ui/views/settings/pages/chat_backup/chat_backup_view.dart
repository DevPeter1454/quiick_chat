import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_backup_viewmodel.dart';

class ChatBackupView extends StatelessWidget {
  const ChatBackupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatBackupViewModel>.reactive(
      viewModelBuilder: () => ChatBackupViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
