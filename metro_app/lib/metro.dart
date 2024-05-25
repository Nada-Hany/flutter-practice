class MetroStation {
  var line = 0;

  final firstLine = [
    "new el marg",
    "el marg",
    "ezbet el nakhl",
    "ain shams",
    "el matarya",
    "helmyet el zaytoun",
    "hadayeq el zaytoun",
    "saray el qobba",
    "hamamat el qobba",
    "hamamat el qobba",
    "manshyet elsadr",
    "el demerdash",
    "ghamra",
    "el shohadaa",
    "ahmed urabi",
    "gamal abdel nasser",
    "el sadat",
    "saad zaghlol",
    "el sayedda zainab",
    "el malek el saleh",
    "mar girgis",
    "el zahraa",
    "dar el salam",
    "hadayek el maadi",
    "maadi",
    "sakanat el maadi",
    "tora el balad",
    "kozzika",
    "tora el asmant",
    "el maasra",
    "hadayek helwa",
    "wadi hof",
    "helwan university",
    "ain helwan",
    "helwan"
  ];
  final secondLine = [
    "el mounib",
    "sakiat mekky",
    "omm el masryen",
    "el giza",
    "faisal",
    "cairo university",
    "el bohoth",
    "dokki",
    "opera",
    "el sadat",
    "mohamed nageb",
    "attaba",
    "el shohadaa",
    "masarra",
    "road el farag",
    "st tresa",
    "khlafawy",
    "mazalat",
    "kolyet el zeraa",
    "shobra el khema"
  ];
  final thirdLine = [
    "airport",
    "ahmed galal",
    "adly mansour",
    "el haykstep",
    "omar ebn elkhattab",
    "qobaa",
    "hesham barakat",
    "el nozha",
    "nadi el shams",
    "alf maskan",
    "helioplis square",
    "haroun",
    "al ahram",
    "kolyet elbanat",
    "stadium",
    "fair zone",
    "abbasia",
    "abdo basha",
    "el geish",
    "bab el shaaria",
    "attaba",
    "gamal abdel nasser",
    "maspero",
    "safaa hegazy",
    "kitkat",
    "sudan street",
    "imbaba"
  ];

  bool validStations(String start, String dest) {
    if (getLine(start) == -1 || getLine(dest) == -1) return false;
    return true;
  }

  int getLine(String value) {
    if (firstLine.contains(value))
      return 1;
    else if (secondLine.contains(value))
      return 2;
    else if (thirdLine.contains(value)) return 3;
    return -1;
  }

  String getDetails(int stations) {
    var s = '';
    s += "time:\n${stations * 2}\n";
    s += "number of stations:\n${stations}\n";
    if (stations <= 8)
      s += "the ticket price is 6 L.E";
    else if (stations <= 16)
      s += "the ticket price is 8 L.E";
    else if (stations <= 23)
      s += "the ticket price is 12 L.E";
    else
      s += "the ticket price is 15 L.E";
    s += '\n';
    return s;
  }

  String getPath(String start, String dest) {
    var out = '';
    //start and dest both in line one
    if (getLine(start) == 1) {
      if (getLine(dest) == 1) {
        final startIndex = firstLine.indexOf(start);
        final destIndex = firstLine.indexOf(dest);
        if (startIndex - destIndex < 0) {
          final route = firstLine.sublist(startIndex + 1, destIndex + 1);
          out += route.toString() + '\n';
          final stations = route.length;
          out += getDetails(stations) + '\n';
        } else {
          final route =
              firstLine.sublist(destIndex, startIndex).reversed.toList();
          out += "route:\n";
          out += route.toString();
          final stations = route.length;
          out += getDetails(stations) + '\n';
        }
      } else if (getLine(dest) == 2) {
      } else if (getLine(dest) == 3) {}
    } else if (getLine(start) == 2) {
      if (getLine(dest) == 1) {
      } else if (getLine(dest) == 2) {
        final startIndex = secondLine.indexOf(start);
        final destIndex = secondLine.indexOf(dest);

        if (startIndex - destIndex < 0) {
          final route = secondLine.sublist(startIndex + 1, destIndex + 1);
          out += route.toString() + '\n';
          final stations = route.length;
          out += getDetails(stations) + '\n';
        } else {
          final route =
              secondLine.sublist(destIndex, startIndex).reversed.toList();
          out += "route:\n";
          out += route.toString() + '\n';
          final stations = route.length;
          getDetails(stations);
        }
      } else if (getLine(dest) == 3) {}
    } else if (getLine(start) == 3) {
      if (getLine(dest) == 1) {
      } else if (getLine(dest) == 2) {
      } else if (getLine(dest) == 3) {}
    }
    return out;
  }
}
