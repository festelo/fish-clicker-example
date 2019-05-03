import 'package:fish_redux/fish_redux.dart';
import '../clicker_component/component.dart';
import 'state.dart';
import 'view.dart';

class MainPage extends Page<MainState, void> {
    MainPage():
        super(
            initState: MainState.initState,
            dependencies: Dependencies(
                slots: {
                  'clicker': ClickerComponent().asDependent(ClickerConnector()),
                },
              ),
            view: mainPageView
        );
}