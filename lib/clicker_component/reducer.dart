import 'package:fish_redux/fish_redux.dart';
import 'state.dart';
import 'action.dart';

ClickerState clickerReducer(ClickerState state, Action action) {
    if (action.type == Actions.increase) { 
        return state.clone()
            ..count = state.count + action.payload;
    }
    return state;
}