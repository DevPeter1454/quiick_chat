import 'package:flutter/material.dart';

import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/services/export.dart';
import 'package:quiick_chat/ui/widgets/common/loading_overlay.dart';

class LoadingManager extends StatefulWidget {
  final Widget child;

  const LoadingManager({
    super.key,
    required this.child,
  });

  @override
  State<LoadingManager> createState() => _LoadingManagerState();
}

class _LoadingManagerState extends State<LoadingManager> {
  final LoadingService _loadingService = locator<LoadingService>();

  @override
  void initState() {
    super.initState();
    _loadingService.addListener(_rebuildOnLoadingChanged);
  }

  @override
  void dispose() {
    _loadingService.removeListener(_rebuildOnLoadingChanged);
    super.dispose();
  }

  void _rebuildOnLoadingChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _loadingService.isLoading,
      loadingText: _loadingService.loadingText,
      child: widget.child,
    );
  }
}
