import 'package:hipal/components/publications/model/provider.dart';
import 'package:hipal/utils/general.dart';

class PublicationInListByResidential {
  PublicationInListByResidential(
      {required this.id,
      required this.provider,
      required this.isPublic,
      required this.file,
      required this.text,
      required this.name,
      required this.type,
      required this.createdAt,
      required this.updatedAt});

  final String id;
  final Provider? provider;
  final bool isPublic;
  final String? file;
  final String text;
  final String name;
  final String type;
  final DateTime? createdAt;
  final String updatedAt;

  PublicationInListByResidential copyWith({
    required String id,
    required Provider? provider,
    required bool isPublic,
    required dynamic file,
    required String text,
    required String name,
    required String type,
    required DateTime? createdAt,
    required String updatedAt,
  }) =>
      PublicationInListByResidential(
          id: id,
          provider: provider,
          isPublic: isPublic,
          file: file,
          text: text,
          name: name,
          type: type,
          createdAt: createdAt,
          updatedAt: updatedAt);

  factory PublicationInListByResidential.fromJson(Map<String, dynamic> json) =>
      PublicationInListByResidential(
          id: json["_id"],
          provider: json["provider"] != null
              ? Provider.fromJson(json["provider"])
              : null,
          isPublic: json["is_public"],
          file: json["file"],
          text: json["text"],
          name: json["name"],
          type: json["type"],
          createdAt: DateTime.tryParse(json["createdAt"]) == null
              ? null
              : DateTime.parse(json["createdAt"]),
          updatedAt: json["updatedAt"]);

  String get createdAtLocal => createdAt != null
      ? DateTimeHelper.ddMMyyyyTT(createdAt!.toLocal())
      : 'unassigned date';
}
