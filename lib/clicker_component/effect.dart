import 'package:fish_redux/fish_redux.dart';
import 'package:http/http.dart' as http;
import 'action.dart';
import 'state.dart';

Effect<ClickerState> clickerEffect() {
  return combineEffects({
    Actions.increaseRandomly: increaseRandomly,
  });
}

Future<void> increaseRandomly(Action action, Context<ClickerState> context) async { 
  final response = await http.read('https://www.random.org/integers/?num=1&min=1&max=10&col=1&base=10&format=plain');
  final value = int.parse(response);
  context.dispatch(ActionsCreate.increase(value));
}