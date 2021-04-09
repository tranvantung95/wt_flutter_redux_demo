class AppState {
  String _quote;
  int _counter;
  int get counter => _counter;
  String get quote => _quote;
  AppState(this._counter, this._quote);
}
