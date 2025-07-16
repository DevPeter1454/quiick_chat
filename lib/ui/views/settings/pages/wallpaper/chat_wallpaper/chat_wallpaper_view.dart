import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'chat_wallpaper_viewmodel.dart';

class ChatWallpaperView extends StatelessWidget {
  const ChatWallpaperView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChatWallpaperViewModel>.reactive(
        viewModelBuilder: () => ChatWallpaperViewModel(),
        builder: (context, model, child) {
          return const Scaffold();
        });
  }
}
