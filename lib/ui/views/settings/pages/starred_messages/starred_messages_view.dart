import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'starred_messages_viewmodel.dart';

class StarredMessagesView extends StatelessWidget {
  const StarredMessagesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StarredMessagesViewModel>.reactive(
      viewModelBuilder: () => StarredMessagesViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
