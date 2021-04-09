import 'package:redux/redux.dart';
import 'package:redux_demo/app_state.dart';
import 'package:redux_demo/redux/action/home_action.dart';

class HomeMiddleWare extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, next) {
    if (action is IncrementAction) {
      next(IncrementActionSucces(store.state.counter + 1));
    }
    next(action);
  }
}
