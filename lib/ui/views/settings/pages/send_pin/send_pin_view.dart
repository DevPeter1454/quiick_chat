import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'send_pin_viewmodel.dart';

class SendPinView extends StatelessWidget {
  const SendPinView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SendPinViewModel>.reactive(
      viewModelBuilder: () => SendPinViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
