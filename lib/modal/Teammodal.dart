class Teammodal {
  Teammodal({
      this.id, 
      this.sponsorId, 
      this.childName, 
      this.childId, 
      this.childStatus,});

  Teammodal.fromJson(dynamic json) {
    id = json['id'];
    sponsorId = json['sponsorId'];
    childName = json['childName'];
    childId = json['childId'];
    childStatus = json['childStatus'];
  }
  int? id;
  String? sponsorId;
  String? childName;
  String? childId;
  String? childStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sponsorId'] = sponsorId;
    map['childName'] = childName;
    map['childId'] = childId;
    map['childStatus'] = childStatus;
    return map;
  }

}