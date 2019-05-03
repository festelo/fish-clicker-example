import 'package:fish_redux/fish_redux.dart';
import '../clicker_component/state.dart';

class MainState implements Cloneable<MainState> { 
    ClickerState clicker;

    @override
    MainState clone() {
        return MainState()
            ..clicker = clicker;
    }
    
    static MainState initState(dynamic params) { 
        return MainState()
          ..clicker = ClickerState();
    }
}

class ClickerConnector extends ConnOp<MainState, ClickerState> { 
  @override
  ClickerState get(MainState state) => state.clicker;

  @override
  void set(MainState state, ClickerState subState) => state.clicker = subState;
}
