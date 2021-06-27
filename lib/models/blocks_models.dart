import 'dart:convert';

BlockResult blocResultFromJson(String str) =>
    BlockResult.fromJson(json.decode(str));

class BlockResult {
  BlockResult({
    required this.data,
  });

  List<Block> data;

  factory BlockResult.fromJson(Map<String, dynamic> json) => BlockResult(
      data: List<Block>.from(json["data"].map((x) => Block.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Block {
  Block({
    required this.id,
    required this.type,
    required this.attributes,
  });

  String id;
  String type;
  Attributes attributes;

  factory Block.fromJson(Map<String, dynamic> json) => Block(
        id: json["id"],
        type: json["type"],
        attributes: Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "attributes": attributes.toJson(),
      };
}

class Attributes {
  Attributes({
    required this.index,
    required this.timestamp,
    required this.data,
    required this.previousHash,
    required this.hash,
  });

  int index;
  int timestamp;
  String data;
  String previousHash;
  String hash;

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        index: json["index"],
        timestamp: json["timestamp"],
        data: json["data"],
        previousHash: json["previous-hash"],
        hash: json["hash"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "timestamp": index,
        "data": index,
        "previous-hash": index,
        "hash": index,
      };
}
