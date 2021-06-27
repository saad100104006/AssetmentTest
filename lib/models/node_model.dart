import 'blocks_models.dart';

class Node {
  String url;
  bool online;
  String name;
  bool loading;
  List<Block> blocks;

  Node({
    required this.url,
    required this.online,
    required this.name,
    required this.loading,
    required this.blocks
  });

  updateStatus(String _name) {
    name = _name;
    online = true;
  }
  updateBlock(List<Block> _blocks) {
    blocks = _blocks;
  }

}
