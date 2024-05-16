import 'package:alladin/common/observer/model/observer.dart';
import 'package:alladin/common/observer/model/subject.dart';

class LGObserver<T> extends Subject<T> {
  T? data;
  final Set<Observer<T>> observers = <Observer<T>>{};

  @override
  void invoke(value) {
    data = value;
    this.notify();
  }

  @override
  void notify() {
    for (var element in observers) {
      if (data != null) {
        element.update(data as T);
      }
    }
  }

  @override
  void observer(Observer<T> o) {
    observers.add(o);
  }

  @override
  void removeObserver(Observer<T> o) {
    observers.remove(o);
  }
}
