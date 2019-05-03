import 'package:fish_redux/fish_redux.dart';
import 'state.dart';
import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class ClickerComponent extends Component<ClickerState> {
  ClickerComponent() : super(
    effect: clickerEffect(),
    reducer: clickerReducer,
    view: clickerView,
  );
}