import 'dart:html';

class Aufgabe {
  static int _id = 0;
  int id;
  final String text;

  Aufgabe(
    this.text,
  ) : this.id = _id++;
}

void aufgabeLoeschen(MouseEvent ereignis) {
  ereignis.stopPropagation();
  var div = (ereignis.currentTarget as Element).parent;
  var button = (ereignis.currentTarget as Element);
  var schluessel = int.parse(button.id.split('-')[0]);
  aufgabenListe.removeWhere((aufgabe) => aufgabe.id == schluessel);
  div.remove();
}

void updateAufgaben() {
  uiListe.children.clear();
  aufgabenListe.forEach((aufgabe) {
    var div = Element.div();
    var buttonRemove = ButtonElement();
    var span = Element.span();

    buttonRemove.text = 'X';
    buttonRemove.id = aufgabe.id.toString();
    buttonRemove.onClick.listen(aufgabeLoeschen);
    span.text = aufgabe.text;

    div.children.add(buttonRemove);
    div.children.add(span);
    uiListe.children.add(div);
  });
}

void addAufgabe(Event ereignis) {
  var aufgabe = Aufgabe(aufgabenInput.value);
  aufgabenListe.add(aufgabe);
  updateAufgaben();
  aufgabenInput.value = '';
}

void aufgabenLoeschen(MouseEvent ereignis) {
  uiListe.children.clear();
  aufgabenListe.clear();
}

InputElement aufgabenInput;
DivElement uiListe;
ButtonElement buttonLoeschen;

List<Aufgabe> aufgabenListe = [];

void main() {
  aufgabenInput = querySelector('#aufgabe');
  uiListe = querySelector('#aufgaben-liste');
  buttonLoeschen = querySelector('#loeschen');

  aufgabenInput.onChange.listen(addAufgabe);
  buttonLoeschen.onClick.listen(aufgabenLoeschen);
}
