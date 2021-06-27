import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_challenge/models/blocks_models.dart';
import 'package:flutter_challenge/models/node_model.dart';
import 'package:http/http.dart' as http;

class NodesProvider with ChangeNotifier {
  final List<Node> _nodes = [];

  NodesProvider() {
    _buildDummyNodes();
  }

  _buildDummyNodes() {
    _nodes.add(
      Node(
          url: 'https://thawing-springs-53971.herokuapp.com',
          online: false,
          name: 'Node 1',
          blocks: [],
          loading: false),
    );
    _nodes.add(
      Node(
          url: 'https://secret-lowlands-62331.herokuapp.com',
          online: false,
          name: 'Node 2',
          blocks: [],
          loading: false),
    );
    _nodes.add(
      Node(
          url: 'https://calm-anchorage-82141.herokuapp.com',
          online: false,
          name: 'Node 3',
          blocks: [],
          loading: false),
    );
    _nodes.add(
      Node(
          url: 'http://localhost:3002',
          online: false,
          name: 'Node 4',
          blocks: [],
          loading: false),
    );
  }

  Future<List<Node>> getInitialNodes() async {
    for (var i = 0; i < _nodes.length; i++) {
      try {
        Node node = _nodes[i];

        final response =
            await http.get(Uri.parse(_getStatusUrlFromNode(node.url))).timeout(
          const Duration(seconds: 10),
          onTimeout: () {
            throw Exception('timeout');
          },
        );
        if (response.statusCode == 200) {
          node.updateStatus(json.decode(response.body)['node_name']);
        }


        //getting the response from each block enpoint

        final blockResponse =
        await http.get(Uri.parse(_getBlockUrlFromNode(node.url))).timeout(
          const Duration(seconds: 10),
          onTimeout: (){
            throw Exception('timeout');
          },
        );

        if(blockResponse.statusCode == 200){
          node.updateBlock(blocResultFromJson(blockResponse.body).data);
        }

        _nodes[i] = node;
      } on Exception catch (_) {}
    }
    notifyListeners();
    return _nodes;
  }

  Future<List<Block>> getBlocksFromNode(String urlNode) async {
    //TODO: Implement the method that get the blocks details here
    return List.empty();
  }

  String _getStatusUrlFromNode(String urlNode) {
    return '$urlNode/api/v1/status';
  }

  String _getBlockUrlFromNode(String urlNode) {
    return '$urlNode/api/v1/blocks';
  }

}
