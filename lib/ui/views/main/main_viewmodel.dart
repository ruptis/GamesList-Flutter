import 'package:stacked/stacked.dart';

class MainViewModel extends BaseViewModel {
  int currentIndex = 0;

  void setIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
