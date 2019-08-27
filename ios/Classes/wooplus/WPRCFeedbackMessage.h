//
//  WPRCFeedbackMessage.h
//  WooPlus
//
//  Created by TeamN on 6/27/16.
//  Copyright © 2016 TeamN. All rights reserved.
//

#import "WPRCMessageContent.h"

@interface WPRCFeedbackMessage : WPRCMessageContent
@property (nonatomic, strong) NSString *feedbackId;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *body;
@end

//to 56a07fdeed107633248b45a4
//{
//    "feedback_id": "57711174ed107689228b45c6",
//    "created_at": 1467027885,
//    "content": "Dear g11, Thank you for your feedback on #TIME#. We have sent you a reply."
//}

//<message xmlns="jabber:client" sid="6cf45a34-1253-4928-85d1-0ae0e517bba6" from="system@58.96.172.189" to="56a07fdeed107633248b45a4@58.96.172.189" type="chat"><body>Dear g11,
//Thank you for your feedback on %TIME%.
//We have sent you a reply.</body><timestamp>1467027885680</timestamp><ext xmlns="chat:xmpp:extend" type="3"><feedback><id>57711174ed107689228b45c6</id><time>1467027885000</time></feedback></ext><timestamp>1467027885680</timestamp><sender><jid>system@58.96.172.189</jid><name>WooPlus</name><system>1</system></sender><receiver><jid>56a07fdeed107633248b45a4@58.96.172.189</jid><name>g11</name><gender>1</gender></receiver></message>
