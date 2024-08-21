class TokenRespModel {
  TokenRespModel({
    required this.detail,
    required this.code,
    required this.messages,
  });

  final String detail;
  final String code;
  final List<Message> messages;

  factory TokenRespModel.fromJson(Map<String, dynamic> json) => TokenRespModel(
        detail: json["detail"],
        code: json["code"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "detail": detail,
        "code": code,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
      };
}

class Message {
  Message({
    required this.tokenClass,
    required this.tokenType,
    required this.message,
  });

  final String tokenClass;
  final String tokenType;
  final String message;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        tokenClass: json["token_class"],
        tokenType: json["token_type"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "token_class": tokenClass,
        "token_type": tokenType,
        "message": message,
      };
}
