import 'package:alladin/common/observer/model/observer.dart';

abstract class Subject<T> {
  void invoke(T value);
  void removeObserver(Observer<T> o);
  void observer(Observer<T> o);
  void notify();
}