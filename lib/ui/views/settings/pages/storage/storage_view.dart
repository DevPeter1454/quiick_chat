import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'storage_viewmodel.dart';

class StorageView extends StatelessWidget {
  const StorageView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StorageViewModel>.reactive(
      viewModelBuilder: () => StorageViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
