import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../app_state.dart';

class IncrementAction {}

class IncrementActionSucces {
  final int counter;
  IncrementActionSucces(this.counter);
}

class UpdateQuoteAction {
  String _quote;
  String get quote => this._quote;
  UpdateQuoteAction(this._quote);
}

ThunkAction<AppState> getRandomQuote = (Store<AppState> store) async {
  http.Response response = await http.get(
    Uri.encodeFull('https://goquotes-api.herokuapp.com/api/v1/random?count=1'),
  );
  Map<String, dynamic> result = json.decode(response.body);
  String quote = result["quotes"][0]['text'];
  store.dispatch(new UpdateQuoteAction(quote));
};
