class Vigenere {
  static String decrypt(String cipherText, String key) {
    String originalCipher = cipherText;
    if (key.length == 0) {
      return cipherText;
    }

    int currKeyIndex = 0;
    String res = "";
    var starts = "Aa";
    var ends = "Zz";
    cipherText = cipherText.toUpperCase();
    key = key.toUpperCase();

    for (int i = 0; i < cipherText.length; i++) {
      bool firstCheck = starts.codeUnitAt(0) <= originalCipher.codeUnitAt(i) &&
          originalCipher.codeUnitAt(i) <= ends.codeUnitAt(0);
      bool secondCheck =
          starts.codeUnitAt(1) <= originalCipher.codeUnitAt(i) &&
              originalCipher.codeUnitAt(i) <= ends.codeUnitAt(1);

      if (firstCheck || secondCheck) {
        var original = cipherText.codeUnitAt(i) - key.codeUnitAt(currKeyIndex);
        original = original % 26;
        currKeyIndex = (currKeyIndex + 1) % key.length;
        original += "A".codeUnitAt(0);
        var currRes = String.fromCharCode(original);
        if (firstCheck) {
          res += currRes;
        } else {
          res += currRes.toLowerCase();
        }
      } else {
        res += originalCipher[i];
      }
    }
    print(" res " + res);
    return res;
  }
}
