import 'package:json_annotation/json_annotation.dart';

enum MemberStatusEnum {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('WAITING_TO_JOIN')
  waitingToJoin,
  @JsonValue('DELETE')
  delete,
}
