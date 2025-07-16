import 'package:flutter/material.dart';
import 'package:quiick_chat/app/app.locator.dart';
import 'package:quiick_chat/services/local_storage_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ChatColorViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();

  // pop screen function
  void back() {
    _navigationService.back();
  }

  // create some values
  Color pickerColor = const Color.fromARGB(255, 241, 241, 241);
  Color currentColor = const Color(0xff443a49);
  List<String> recentSavedColors = [];
  List<bool> colorPressed = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];
//  selecting colors from pallets///////............................................
  void resetColorPressed() {
    colorPressed = [
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
      false,
    ];
    notifyListeners();
  }

  void updateColorPick(Color color, int indexer) {
    changeColor(color);
    resetColorPressed();
    colorPressed[indexer] = !colorPressed[indexer];
    notifyListeners();
  }

// ValueChanged<Color> callback
  void changeColor(Color color) {
    pickerColor = color;
  }

  Future<void> updateChatColor(String colorChat) async {
    _localStorageService.saveChatColorToken(colorChat);
    notifyListeners();
  }

  List<String>? savedColors() {
    List<String>? allColors = _localStorageService.getColorList();
    if (allColors == null) {
      _localStorageService.saveColorList([
        'FF443A49',
        'FF443A49',
        'FF443A49',
        'FF5759DC',
        'FF54A270',
        'FFAF2485',
        'FFAF2485',
        'FF50775E',
        'FF294ED1',
        'FFC93232',
        'FFB4B616',
        'FF2A90BD',
        'FFEB9525',
        'FFA22020'
      ]);
      notifyListeners();
      return _localStorageService.getColorList();
    }
    recentSavedColors = allColors;
    notifyListeners();
    return allColors;
  }

  // Saving colors to List>>>>>>>>>.......................................
  Future<void> toSaveColors(String color) async {
    List<String>? previousColors = _localStorageService.getColorList();
    if (previousColors != null && previousColors.length >= 14) {
      previousColors.removeAt(0);
      previousColors.add(color);
      _localStorageService.saveColorList(previousColors);
    } else {
      previousColors?.add(color);
      _localStorageService.saveColorList(previousColors!);
    }
  }
}
