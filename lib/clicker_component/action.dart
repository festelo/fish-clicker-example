import 'package:fish_redux/fish_redux.dart';

enum Actions { increase, increaseRandomly }
class ActionsCreate { 
    static Action increase(int value) => Action(Actions.increase, payload: value);
    static Action increaseRandomly() => const Action(Actions.increaseRandomly); 
}