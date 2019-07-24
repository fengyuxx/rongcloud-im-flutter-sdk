// 会话类型
class RCConversationType {
  static const int Private = 1;
  static const int Group = 3;
  static const int ChatRoom = 4;
  static const int System = 6;
}

//method list
class RCMethodKey {
  static const String Init = 'init';
  static const String Config = 'config';
  static const String Connect = 'connect';
  static const String Disconnect = 'disconnect';
  static const String SendMessage = 'sendMessage';
  static const String RefreshUserInfo = 'refreshUserInfo';
  static const String JoinChatRoom = 'joinChatRoom';
  static const String QuitChatRoom = 'quitChatRoom';
  static const String GetHistoryMessage = 'getHistoryMessage';
  static const String GetConversationList = 'getConversationList';
  static const String GetChatRoomInfo = 'getChatRoomInfo';
  static const String ClearMessagesUnreadStatus = 'clearMessagesUnreadStatus';
  static const String SetServerInfo = 'setServerInfo';
  static const String SetCurrentUserInfo = 'setCurrentUserInfo';
  static const String InsertIncomingMessage = 'insertIncomingMessage';
  static const String InsertOutgoingMessage = 'insertOutgoingMessage';
  static const String GetTotalUnreadCount = 'getTotalUnreadCount';
  static const String GetUnreadCountTargetId = 'getUnreadCountTargetId';
  static const String GetUnreadCountConversationTypeList = 'getUnreadCountConversationTypeList';
  static const String SetConversationNotificationStatus = 'setConversationNotificationStatus';
  static const String GetConversationNotificationStatus = 'getConversationNotificationStatus';
  static const String RemoveConversation = 'RemoveConversation';
  static const String GetBlockedConversationList = 'getBlockedConversationList';
  static const String SetConversationToTop = 'setConversationToTop';
  static const String GetTopConversationList = 'getTopConversationList';

  static const String SetMessageReceivedStatus = 'setMessageReceivedStatus';
  static const String SetMessageSentStatus = 'setMessageSentStatus';
}

//callback list //native 会触发此方法
class RCMethodCallBackKey {
  static const String SendMessage = 'sendMessageCallBack';
  static const String RefreshUserInfo = 'refreshUserInfoCallBack';
  static const String ReceiveMessage = 'receiveMessageCallBack';
  static const String JoinChatRoom = 'joinChatRoomCallBack';
  static const String QuitChatRoom = 'quitChatRoomCallBack';
  static const String UploadMediaProgress = 'uploadMediaProgressCallBack';
  static const String GetRemoteHistoryMessages = 'getRemoteHistoryMessagesCallBack';
  static const String ConnectionStatusChange = 'ConnectionStatusChangeCallBack';

}
