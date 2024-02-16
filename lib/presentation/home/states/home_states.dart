import 'package:alladin/common/viewevent/view_event.dart';
import 'package:alladin/domain/model/carpet.dart';

class HomeLoadingEvent extends ViewEvent {
  bool isLoading;

  HomeLoadingEvent({required this.isLoading}) : super("HomeLoadingEvent");
}

class HomeLoadedEvent extends ViewEvent {
  List<Carpet> carpets = [];

  HomeLoadedEvent({required this.carpets}) : super("HomeLoadedEvent");
}

class HomeExceptionEvent extends ViewEvent {
  Exception? e;

  HomeExceptionEvent({required this.e}) : super("HomeExceptionEvent");
}

class HomeEmptyEvent extends ViewEvent {
  HomeEmptyEvent() : super("HomeExceptionEvent");
}
