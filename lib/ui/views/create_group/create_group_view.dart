import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'create_group_viewmodel.dart';

class CreateGroupView extends StackedView<CreateGroupViewModel> {
  const CreateGroupView({super.key});

  @override
  Widget builder(
    BuildContext context,
    CreateGroupViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        child: const Center(child: Text("CreateGroupView")),
      ),
    );
  }

  @override
  CreateGroupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      CreateGroupViewModel();
}
