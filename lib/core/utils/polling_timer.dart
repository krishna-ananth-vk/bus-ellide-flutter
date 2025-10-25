import 'dart:async';

class PollingTimer {
  Timer? _timer;

  void start(Duration interval, void Function() callback) {
    stop();
    _timer = Timer.periodic(interval, (_) => callback());
  }

  void stop() {
    _timer?.cancel();
  }
}
