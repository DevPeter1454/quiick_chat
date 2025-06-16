import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_color_viewmodel.dart';

class ChatColorView extends StackedView<ChatColorViewModel> {
  const ChatColorView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatColorViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("ChatColorView")),
      ),
    );
  }

  @override
  ChatColorViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ChatColorViewModel();
}
