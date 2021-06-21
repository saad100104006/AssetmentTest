import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/models/node_model.dart';

class NodeWidget extends StatelessWidget {
  final Node node;

  NodeWidget({required this.node});

  @override
  Widget build(BuildContext context) {
    var colorDot = node.online ? Colors.green : Colors.red;
    var textStatus = node.online ? "ONLINE" : "OFFLINE";
    var textStyle = node.online
        ? const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)
        : const TextStyle(
            fontSize: 10, color: Color.fromRGBO(138, 144, 147, 1.0));

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  node.name,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/dot.png',
                  color: colorDot,
                ),
                Text(
                  textStatus,
                  style: textStyle,
                ),
              ],
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Text(node.url, style: Theme.of(context).textTheme.bodyText2),
        )
      ],
    );
  }
}
