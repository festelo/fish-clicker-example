import 'package:fish_redux/fish_redux.dart';

class ClickerState implements Cloneable<ClickerState> { 
    int count = 0;

    @override
    ClickerState clone() {
        return ClickerState()
            ..count = count;
    }
}