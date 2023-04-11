import 'package:intl/intl.dart';

import '../../../services/format_date.dart';

class PowerAssemblyM {
  String sId = '';
  dynamic residential = '';
  String link = '';
  String? secondDate;
  String? date;
  List<dynamic>? uploadOrder;
  String? announcementDescription;
  String? announcementName;
  String assemblyName = '';
  String? createdAt;
  String? updatedAt;
  int? iV;

  PowerAssemblyM(
      {required this.sId,
      required this.residential,
      required this.link,
      this.secondDate,
      this.date,
      this.uploadOrder,
      this.announcementDescription,
      this.announcementName,
      required this.assemblyName,
      this.createdAt,
      this.updatedAt,
      this.iV});

  PowerAssemblyM.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    residential = json['residential'];
    link = json['link'] ?? '';
    secondDate = json['second_date'];
    date = json['date'];
    if (json['upload_order'] != null) {
      uploadOrder = <dynamic>[];
      json['upload_order'].forEach((v) {
        uploadOrder!.add(v);
      });
    }
    announcementDescription = json['announcement_description'];
    announcementName = json['announcement_name'];
    assemblyName = json['assembly_name'] ?? '';
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['residential'] = this.residential;
    data['link'] = this.link;
    data['second_date'] = this.secondDate;
    data['date'] = this.date;
    if (this.uploadOrder != null) {
      data['upload_order'] = this.uploadOrder?.map((v) => v).toList();
    }
    data['announcement_description'] = this.announcementDescription;
    data['announcement_name'] = this.announcementName;
    data['assembly_name'] = this.assemblyName;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }

  String formattedDate(String date) {
    return FormatDate.formatDate(DateTime.parse(date));
  }
}