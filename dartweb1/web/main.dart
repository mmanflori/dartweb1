import 'dart:html';

void main() {
  querySelector('[name="felix"]').text = 'Die Dart Anwendung läuft !';
  NumberInputElement meinWert = querySelector('#nummer');
  meinWert.value = '33';
}
