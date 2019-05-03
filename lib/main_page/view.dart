import 'package:flutter/material.dart';

Widget mainPageView(state, dispatch, viewService) { 
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