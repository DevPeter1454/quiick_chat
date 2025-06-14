import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'send_viewmodel.dart';

class SendView extends StatelessWidget {
  const SendView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendViewModel>.reactive(
      viewModelBuilder: () => SendViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
