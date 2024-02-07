extension TravelDate on DateTime {
  // N박 N일 형식으로 반환
  String toNDayString(DateTime diffDate) {
    if (diffDate.isAfter(this)) {
      return "${diffDate.difference(this).inDays}박 ${diffDate.difference(this).inDays + 1}일";
    } else {
      return "${difference(diffDate).inDays}박 ${difference(diffDate).inDays + 1}일";
    }
  }
}
