import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'storage_and_data_viewmodel.dart';

class StorageAndDataView extends StatelessWidget {
  const StorageAndDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StorageAndDataViewModel>.reactive(
      viewModelBuilder: () => StorageAndDataViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
