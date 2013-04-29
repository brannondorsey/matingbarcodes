class AbstractBarcode {

  String fatherText;
  String motherText;
  String text;
  long timestamp;

  AbstractBarcode(String _text, String _fatherText, String _motherText) {
    text = _text;
    fatherText = _fatherText;
    motherText = _motherText;
    timestamp = millis(); 
  }
}

