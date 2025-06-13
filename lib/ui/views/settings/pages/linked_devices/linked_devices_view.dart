import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'linked_devices_viewmodel.dart';

class LinkedDevicesView extends StatelessWidget {
  const LinkedDevicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LinkedDevicesViewModel>.reactive(
      viewModelBuilder: () => LinkedDevicesViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
