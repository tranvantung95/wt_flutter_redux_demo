import 'package:redux/redux.dart';
import 'package:redux_demo/app_state.dart';
import 'package:redux_demo/redux/middleware/home_middleware.dart';
import 'package:redux_demo/redux/reducer/app_reducer.dart';
import 'package:redux_thunk/redux_thunk.dart';

Store<AppState> createStore() {
  return Store<AppState>(appReducer,
      initialState: AppState(0, ""),
      middleware: [HomeMiddleWare(),
      thunkMiddleware]);
}
