import 'package:redux_demo/app_state.dart';
import 'package:redux_demo/redux/action/home_action.dart';

AppState appReducer(AppState prev, dynamic action) {
  if (action is IncrementActionSucces) {
    return AppState(
      action.counter,
      prev.quote,
    );
  } else if (action is UpdateQuoteAction) {
    return AppState(prev.counter, action.quote);
  } else
    return prev;
}
