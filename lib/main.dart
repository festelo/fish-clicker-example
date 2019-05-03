import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fish_redux/fish_redux.dart'; // нужно добавить fish_redux в зависимости
import 'package:http/http.dart' as http; // нужно добавить http в зависимости

class ClickerState implements Cloneable<ClickerState> { 
    int count = 0;

    @override
    ClickerState clone() {
        return ClickerState()
            ..count = count;
    }
}
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

enum Actions { increase, increaseRandomly }
class ActionsCreate { 
    static Action increase(int value) => Action(Actions.increase, payload: value);
    static Action increaseRandomly() => const Action(Actions.increaseRandomly); 
}

ClickerState clickerReducer(ClickerState state, Action action) {
    if (action.type == Actions.increase) { 
        return state.clone()
            ..count = state.count + action.payload;
    }
    return state;
}

Widget clickerView(ClickerState state, Dispatch dispatch, ViewService viewService) { 
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            RaisedButton(
                child: Text(state.count.toString()),
                onPressed: () => dispatch(ActionsCreate.increase(1))
            ),
            RaisedButton(
                child: const Text('Increase randomly'),
                onPressed: () => dispatch(ActionsCreate.increaseRandomly())
            ),
        ]
    );
}

class ClickerComponent extends Component<ClickerState> {
  ClickerComponent() : super(
    effect: clickerEffect(),
    reducer: clickerReducer,
    view: clickerView,
  );
}

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

class MainPage extends Page<MainState, void> {
    MainPage():
        super(
            initState: MainState.initState,
            dependencies: Dependencies(
                slots: {
                  'clicker': ClickerComponent().asDependent(ClickerConnector()),
                },
              ),
            view: (state, dispatch, viewService) { 
                final clickerWidget = viewService.buildComponent('clicker');
                return Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Center(
                        child: clickerWidget, 
                      )
                    ],
                  )
                );
            },
        );
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(home: MainPage().buildPage(null));
}
