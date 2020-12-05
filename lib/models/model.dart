class Station {
  String name;
  int id;

  Station({this.name, this.id});
}

class Candidate {
  String party;
  String name;
  int id;
  int type;
  int count;
  String thumb;
  String flag;

  Candidate({
    this.id,
    this.type,
    this.count,
    this.name,
    this.party,
    this.flag,
    this.thumb,
  });
}
