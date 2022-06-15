

class Activity {
  int? id;
  String? kegiatan;
  int? isCompleted;
  String? date;
  String? startTime;
  String? endTime;
  int? color;

  Activity({
    this.id,
    this.kegiatan,
    this.isCompleted,
    this.date,
    this.startTime,
    this.endTime,
    this.color,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kegiatan = json['kegiatan'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['kegiatan'] = this.kegiatan;
    data['isCompleted'] = this.isCompleted;
    data['data'] = this.date;
    data['startTime'] = this.startTime;
    data['endTime'] = this.endTime;
    data['color'] = this.color;
    return data;
  }
}
