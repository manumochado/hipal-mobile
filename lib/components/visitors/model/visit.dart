
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:hipal/components/user/model/apartmentUser.dart';
import 'package:hipal/serializers/image.dart';

import 'package:hipal/serializers/serializers.dart';
import 'package:hipal/serializers/typefilter.dart';


part 'visit.g.dart';

abstract class Visit implements Built<Visit, VisitBuilder> {
  @BuiltValueField(wireName: '_id')
  String? get id;
  ApartmentUser? get apartment;
  String? get color;
  String? get licensePlate;
  String? get mark;
  int? get NumberPeople;
  String? get state;
  String? get typeVisit;
  String? get typeArrival;
  String? get hour;
  DateTime? get date;
  String? get driverName;
  String? get identity;
  String? get fullName;
  Image? get image;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  Visit._();
  factory Visit([void Function(VisitBuilder) updates]) = _$Visit;

  Visit copyWith(Visit updates) {
    return Visit((b) => b
      ..id = updates.id ?? id
      ..apartment = (updates.apartment ?? apartment) as ApartmentUserBuilder?
      ..color = updates.color ?? color
      ..licensePlate = updates.licensePlate ?? licensePlate
      ..mark = updates.mark ?? mark
      ..NumberPeople = updates.NumberPeople ?? NumberPeople
      ..state = updates.state ?? state
      ..typeVisit = updates.typeVisit ?? typeVisit
      ..typeArrival = updates.typeArrival ?? typeArrival
      ..hour = updates.hour ?? hour
      ..date = updates.date ?? date
      ..driverName = updates.driverName ?? driverName
      ..identity = updates.identity ?? identity
      ..fullName = updates.fullName ?? fullName
      ..image = (updates.image ?? image) as ImageBuilder?
      ..createdAt = updates.createdAt ?? createdAt
      ..updatedAt= updates.updatedAt ?? updatedAt
    );
  }


  Object? toJson() {
    return serializers.serializeWith(Visit.serializer, this);
  }

  static Visit? fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Visit.serializer, json);
  }

  static Serializer<Visit> get serializer => _$visitSerializer;
}