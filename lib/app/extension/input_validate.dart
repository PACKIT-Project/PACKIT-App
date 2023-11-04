extension InputValidate on String {
  // 닉네임 검증(2~13자의 한글, 영문, 숫자, -, _)
  bool isValidNick() {
    return RegExp(r"^(?=.*[a-z0-9가-힣])[a-z0-9가-힣_-]{2,13}$").hasMatch(this);
  }
}
