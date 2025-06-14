import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'wallpaper_viewmodel.dart';

class WallpaperView extends StatelessWidget {
  const WallpaperView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WallpaperViewModel>.reactive(
      viewModelBuilder: () => WallpaperViewModel(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Container(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
        ),
      ),
    );
  }
}
