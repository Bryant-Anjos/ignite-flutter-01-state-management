class StateManagement<T> {
  late T _state;
  var _listeners = <Function(T state)>[];

  StateManagement({
    required T initialState,
  }) {
    this._state = initialState;
  }

  T get state => _state;

  void setState(T state) {
    _state = state;
    _update();
  }

  void _update() {
    _listeners.forEach((listener) {
      listener(state);
    });
  }

  Function listen(Function(T state) onUpdate) {
    _listeners.add(onUpdate);
    return _unsubscribe(_listeners.length - 1);
  }

  Function _unsubscribe(int index) {
    return () {
      _listeners.removeAt(index);
    };
  }
}
