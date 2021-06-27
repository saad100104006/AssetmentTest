import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../models/blocks_models.dart';

class BlockListWidget extends StatelessWidget {
  final List<Block>? blocks;

  const BlockListWidget({Key? key, this.blocks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          blocks!.length,
          (index) => Container(
                margin: EdgeInsets.only(bottom: 3, left: 5, right: 5),
                color: Color(0xffd6d6d6),
                width: double.infinity,
                child:Padding(
                  padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '00${blocks![index].id}',
                      style: TextStyle(
                          fontSize: 8, color: Colors.blueAccent.shade700),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      blocks![index].attributes.data,
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                ),
              )),
    );
  }
}
