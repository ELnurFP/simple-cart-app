import 'package:rxdart/rxdart.dart';

class RootBloc {
  int _previousIndex = 0;

  final _bnbIndexController = BehaviorSubject<int>.seeded(0);

  Stream<int> get bnbIndex$ => _bnbIndexController.stream;

  int get bnbIndex => _bnbIndexController.value;

  void _updateBnbIndex(int value) => _bnbIndexController.add(value);

  void close() {
    _bnbIndexController.close();
  }

  void jumpToBnbTab(int value) {
    _previousIndex = bnbIndex;
    _updateBnbIndex(value);
  }

  bool get reverse => _previousIndex >= bnbIndex;
}
