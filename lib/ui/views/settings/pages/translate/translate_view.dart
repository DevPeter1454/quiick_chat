import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'translate_viewmodel.dart';

class TranslateView extends StatelessWidget {
  const TranslateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TranslateViewModel>.reactive(
      viewModelBuilder: () => TranslateViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
