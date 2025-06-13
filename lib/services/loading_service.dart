import 'package:quiick_chat/app/app.logger.dart';

class LoadingService {
  final logger = getLogger('LoadingService');

  // Remove the NavigationService dependency if it's not needed
  // If you do need it, we'll need to use a factory instead

  bool _isLoading = false;
  String? _loadingText;

  bool get isLoading => _isLoading;
  String? get loadingText => _loadingText;

  // Remove constructor parameter if not needed
  LoadingService();

  void showLoading({String? loadingText}) {
    logger.i('Showing loading overlay: $loadingText');
    _isLoading = true;
    _loadingText = loadingText;
    notifyListeners();
  }

  void hideLoading() {
    logger.i('Hiding loading overlay');
    _isLoading = false;
    _loadingText = null;
    notifyListeners();
  }

  // For reactive UI updates
  final List<Function()> _listeners = [];

  void addListener(Function() listener) {
    _listeners.add(listener);
  }

  void removeListener(Function() listener) {
    _listeners.remove(listener);
  }

  void notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }
}
