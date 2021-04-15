class Vigenere {
  String decrypt(String cipherText, String key) {
    int currKeyIndex = 0;
    String res = "";
    var starts = "Aa";
    var ends = "Zz";

    for (int i = 0; i < cipherText.length; i++) {
      bool first_check = starts.codeUnitAt(0) <= cipherText.codeUnitAt(i) &&
          cipherText.codeUnitAt(i) <= ends.codeUnitAt(0);
      bool second_check = starts.codeUnitAt(1) <= cipherText.codeUnitAt(i) &&
          cipherText.codeUnitAt(i) <= ends.codeUnitAt(1);

      if (first_check || second_check) {
        var original = cipherText.codeUnitAt(i) - key.codeUnitAt(currKeyIndex);
        original = original % 26;
        currKeyIndex = (currKeyIndex + 1) % key.length;

        if (first_check) {
          original += "A".codeUnitAt(0);
        } else {
          original += "a".codeUnitAt(0);
        }
        res += String.fromCharCode(original);
      } else {
        res += cipherText[i];
      }
    }
    return res;
  }
}
