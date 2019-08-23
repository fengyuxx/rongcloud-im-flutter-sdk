import 'dart:core';
import 'dart:convert' show json;

import 'message.dart';
import 'conversation.dart';
import 'chatroom_info.dart';

import 'message_content.dart';
import 'text_message.dart';
import 'image_message.dart';
import 'voice_message.dart';
import 'hq_voice_message.dart';

class MessageFactory extends Object {
  factory MessageFactory() =>_getInstance();
  static MessageFactory get instance => _getInstance();
  static MessageFactory _instance;
  MessageFactory._internal() {
    // 初始化
  }
  static MessageFactory _getInstance() {
    if (_instance == null) {
      _instance = new MessageFactory._internal();
    }
    return _instance;
  }

  Message string2Message(String msgJsonStr) {
    if(msgJsonStr == null) {
      return null;
    }
    Map map = json.decode(msgJsonStr);
    return map2Message(map);
  }

  Conversation string2Conversation(String conJsonStr) {
    Map map = json.decode(conJsonStr);
    return map2Conversation(map);
  }

  ChatRoomInfo map2ChatRoomInfo(Map map) {
    ChatRoomInfo chatRoomInfo = new ChatRoomInfo();
    chatRoomInfo.targetId = map["targetId"];
    chatRoomInfo.memberOrder = map["memberOrder"];
    chatRoomInfo.totalMemeberCount = map["totalMemeberCount"];
    List memList = new List();
    for(Map memMap in map["memberInfoList"]) {
        memList.add(map2ChatRoomMemberInfo(memMap));
    }
    chatRoomInfo.memberInfoList = memList;
    return chatRoomInfo;
  }

  ChatRoomMemberInfo map2ChatRoomMemberInfo(Map map) {
    ChatRoomMemberInfo chatRoomMemberInfo = new ChatRoomMemberInfo();
    chatRoomMemberInfo.userId = map["userId"];
    chatRoomMemberInfo.joinTime = map["joinTime"];
    return chatRoomMemberInfo;
  }

  Message map2Message(Map map) {
    Message message = new Message();
    message.conversationType = map["conversationType"];
    message.targetId = map["targetId"];
    message.messageId = map["messageId"];
    message.messageDirection = map["messageDirection"];
    message.senderUserId = map["senderUserId"];
    message.receivedStatus = map["receivedStatus"];
    message.sentStatus = map["sentStatus"];
    message.sentTime = map["sentTime"];
    message.objectName = map["objectName"];
    message.messageUId = map["messageUId"];
    String contenStr = map["content"];
    MessageContent content = string2MessageContent(contenStr,message.objectName);
    if(content != null) {
      message.content = content;
    }else {
      print(message.objectName+":该消息不能被解析!消息内容被保存在 Message.originContentMap 中");
      Map map = json.decode(contenStr.toString());
      message.originContentMap = map;
    }
    return message;
  }

  Conversation map2Conversation(Map map) {
    Conversation con = new Conversation();
    con.conversationType = map["conversationType"];
    con.targetId = map["targetId"];
    con.unreadMessageCount = map["unreadMessageCount"];
    con.receivedStatus = map["receivedStatus"];
    con.sentStatus = map["sentStatus"];
    con.sentTime = map["sentTime"];
    con.isTop = map["isTop"];
    con.objectName = map["objectName"];
    con.senderUserId = map["senderUserId"];
    con.latestMessageId = map["latestMessageId"];

    String contenStr = map["content"];
    MessageContent content = string2MessageContent(contenStr,con.objectName);
    if(content != null) {
      con.latestMessageContent = content;
    }else {
      print(con.objectName+":该消息不能被解析!消息内容被保存在 Conversation.originContentMap 中");
      Map map = json.decode(contenStr.toString());
      con.originContentMap = map;
    }
    return con;
  }

  
  MessageContent string2MessageContent(String contentS,String objectName) {
    MessageContent content = null;
    if(objectName == TextMessage.objectName) {
      content = new TextMessage();
      content.decode(contentS);
    }else if(objectName == ImageMessage.objectName) {
      content = new ImageMessage();
      content.decode(contentS);
    }else if(objectName == HQVoiceMessage.objectName) {
      content = new HQVoiceMessage();
      content.decode(contentS);
    }else if(objectName == VoiceMessage.objectName) {
      content = new HQVoiceMessage();
      content.decode(contentS);
    }
    return content;
  }


  Map messageContent2Map(MessageContent content) {
    Map map = new Map();
    return map;
  }
}