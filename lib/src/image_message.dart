import 'rc_status_define.dart';
import 'message_content.dart';
import 'dart:convert' show json;

class ImageMessage extends MessageContent {
  static const String objectName = "RC:ImgMsg";

  String localPath;
  String extra;
  String content;
  String imageUri;

  @override
  void decode(String jsonStr) {
    Map map = json.decode(jsonStr.toString());
    this.localPath = map["localPath"];
    this.content = map["content"];
    this.imageUri = map["imageUri"];
    this.extra = map["extra"];
  }

  @override
  String encode() {
    Map map = {"localPath":this.localPath,"extra":this.extra};
    return json.encode(map);
  }

  @override
  String conversationDigest() {
    return "图片";
  }

  @override
  String getObjectName() {
    return objectName;
  }
}