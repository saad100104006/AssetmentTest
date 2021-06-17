import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/models/node_model.dart';

class NodeElement {
  bool isExpanded;
  final Node node;
  Widget body;

  NodeElement({
    required this.isExpanded,
    required this.body,
    required this.node,
  });

  set widgetBody(Widget _body) {
    body = _body;
  }
}
