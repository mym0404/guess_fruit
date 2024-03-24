import '../../../../export.dart';

part 'chat_schema.freezed.dart';
part 'chat_schema.g.dart';

@freezed
class ChatSchema with _$ChatSchema {
  const ChatSchema._();
  const factory ChatSchema({
    required DateTime created,
    required String content,
    required bool isFromUser,
    @Default(false) bool isError,
  }) = _ChatSchema;

  factory ChatSchema.fromJson(Map<String, dynamic> json) =>
      _$ChatSchemaFromJson(json);

  String get role => isFromUser ? 'user' : 'model';
}
