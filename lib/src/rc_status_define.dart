//消息发送状态
class RCSentStatus {
  static const int Sending = 10; //发送中
  static const int Failed = 20; //发送失败
  static const int Sent = 30; //发送成功
}

//消息方向
class RCMessageDirection {
  static const int Send = 1;
  static const int Receive = 2;
}

//消息接收状态
class RCReceivedStatus {
  static const int Unread = 0; //未读
  static const int Read = 1; //已读
  static const int Listened = 2; //已听，语音消息
  static const int Downloaded = 4; //已下载
  static const int Retrieved = 8; //已经被其他登录的多端收取过
  static const int MultipleReceive = 16; //被多端同时收取
}

//回调状态
class RCOperationStatus {
  static const int Success = 0;
  static const int Failed = 1;
}

//聊天室成员顺序
class RCChatRoomMemberOrder {
  static const int Asc = 1; //升序，最早加入
  static const int Desc = 2; //降序，最晚加入
}

class RCConnectionStatus {
  static const int Connected = 0; //连接成功
  static const int Connecting = 1; //连接中
  static const int KickedByOtherClient = 2; //该账号在其他设备登录，导致当前设备掉线
  static const int NetworkUnavailable = 3; //网络不可用
  static const int TokenIncorrect = 4; //token 非法，此时无法连接 im，需重新获取 token
  static const int UserBlocked = 5; //用户被封禁
  static const int Unconnected = 11; //连接失败或未连接
}
