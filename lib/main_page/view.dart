import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Widget mainPageView(MainState state, Dispatch dispatch, ViewService viewService)  { 
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
}