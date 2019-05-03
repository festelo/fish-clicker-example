import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'action.dart';
import 'state.dart';

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