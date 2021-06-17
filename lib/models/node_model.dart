class Node {
  String url;
  bool online;
  String name;
  bool loading;

  Node({
    required this.url,
    required this.online,
    required this.name,
    required this.loading,
  });

  updateStatus(String _name) {
    name = _name;
    online = true;
  }
}
