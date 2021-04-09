import 'package:redux/redux.dart';
import 'package:redux_demo/app_state.dart';
import 'package:redux_demo/redux/action/home_action.dart';

class HomeViewModel {
  final int counter;
  final String qoute;
  final Function() increment;
  final Function() getQoute;

  HomeViewModel({this.counter, this.qoute, this.increment, this.getQoute});
  static HomeViewModel fromStore(Store<AppState> store) {
    return HomeViewModel(
        counter: store.state.counter,
        qoute: store.state.quote,
        increment: () {
          store.dispatch(IncrementAction());
        },
        getQoute: () {
          store.dispatch(getRandomQuote);
        });
  }
}
