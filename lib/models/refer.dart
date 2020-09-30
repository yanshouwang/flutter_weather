import 'dart:convert';

class Refer {
  /// 原始数据来源，可能为空
  final List<String> sources;

  /// 数据许可证
  final List<String> license;

  Refer(this.sources, this.license);

  factory Refer.fromJSON(String source) {
    final map = jsonDecode(source);
    return Refer.fromKVPair(map);
  }

  factory Refer.fromKVPair(Map<String, dynamic> source) {
    final sources = source['sources'].cast<String>();
    final license = source['license'].cast<String>();
    return Refer(sources, license);
  }

  String toJSON() {
    final map = toKVPair();
    return jsonEncode(map);
  }

  Map<String, dynamic> toKVPair() {
    return <String, dynamic>{
      'sources': this.sources,
      'license': this.license,
    };
  }
}
