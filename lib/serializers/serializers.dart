import 'package:built_collection/built_collection.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:hipal/components/Management/advertisements/model/advertisements.dart';
import 'package:hipal/components/Management/advertisements/model/managementReport.dart';
import 'package:hipal/components/Management/attentionResident/model/directoryCollaborator.dart';
import 'package:hipal/components/Management/bankAccounts/model/bank.dart';
import 'package:hipal/components/Management/bankAccounts/model/bankAccount.dart';
import 'package:hipal/components/Management/informationManagement/model/management.dart';
import 'package:hipal/components/assembly/model/commentAssembly.dart';
import 'package:hipal/components/assembly/model/currentlyAssembly.dart';
import 'package:hipal/components/assembly/model/historyAssembly.dart';
import 'package:hipal/components/assembly/model/powerAssembly.dart';
import 'package:hipal/components/assembly/model/rules.dart';
import 'package:hipal/components/assembly/model/uploadOrder.dart';
import 'package:hipal/components/chats/model/chat.dart';
import 'package:hipal/components/classifieds/model/classified.dart';
import 'package:hipal/components/classifieds/model/classifiedComment.dart';
import 'package:hipal/components/classifieds/model/classifiedLike.dart';
import 'package:hipal/components/commonZones/model/schedule.dart';
import 'package:hipal/components/commonZones/model/times.dart';
import 'package:hipal/components/coownership_budget/model/coownership_budget.dart';
import 'package:hipal/components/delivery/model/addressDelivery.dart';
import 'package:hipal/components/delivery/model/comment.dart';
import 'package:hipal/components/delivery/model/delivery.dart';
import 'package:hipal/components/directory/model/directory_emergency.dart';
import 'package:hipal/components/directory/model/directory_residential.dart';
import 'package:hipal/components/documentaryCenter/model/documentaryCenter.dart';
import 'package:hipal/components/employees/model/employee.dart';
import 'package:hipal/components/events/model/event_register.dart';
import 'package:hipal/components/events/model/events.dart';
import 'package:hipal/components/families/model/family.dart';
import 'package:hipal/components/friends/model/friends.dart';
import 'package:hipal/components/locker/model/locker.dart';
import 'package:hipal/components/lostObjects/model/lost_object.dart';
import 'package:hipal/components/messages/model/chatMessageType.dart';
import 'package:hipal/components/messages/model/message.dart';
import 'package:hipal/components/messages/model/messageLast.dart';
import 'package:hipal/components/messages/model/messageStatus.dart';
import 'package:hipal/components/myservices/model/service.dart';
import 'package:hipal/components/pets/model/pet.dart';
import 'package:hipal/components/streaming/model/streaming.dart';
import 'package:hipal/components/user/model/apartmentUser.dart';
import 'package:hipal/components/user/model/city.dart';
import 'package:hipal/components/user/model/phone.dart';
import 'package:hipal/components/user/model/photo.dart';
import 'package:hipal/components/user/model/residential.dart';
import 'package:hipal/components/user/model/tower.dart';
import 'package:hipal/components/user/model/user.dart';
import 'package:hipal/components/user/model/userInfo.dart';
import 'package:hipal/components/user/model/userName.dart';
import 'package:hipal/components/vehicles/model/vehicle.dart';
import 'package:hipal/components/visitors/model/visit.dart';
import 'package:hipal/serializers/accountType.dart';
import 'package:hipal/serializers/apartment.dart';
import 'package:hipal/serializers/document.dart';
import 'package:hipal/serializers/image.dart';
import 'package:hipal/serializers/pagination.dart';
import 'package:hipal/serializers/profile.dart';
import 'package:hipal/serializers/profileAuth.dart';
import 'package:hipal/serializers/profiledetail.dart';
import 'package:hipal/serializers/profileuser.dart';
import 'package:hipal/serializers/provider.dart';
import 'package:hipal/serializers/rol.dart';
import 'package:hipal/serializers/typefilter.dart';

part 'serializers.g.dart';

@SerializersFor([
  Pet,
  Family,
  Vehicle,
  Employee,
  Apartment,
  TypeFilter,
  Image,
  Pagination,
  UserInfo,
  User,
  ApartmentUser,
  Delivery,
  AddressDelivery,
  Comment,
  Visit,
  Locker,
  Service,
  Comment,
  LostObject,
  Residential,
  Chat,
  Message,
  MessageLast,
  ChatMessageType,
  MessageStatus,
  Profile,
  ProfileDetail,
  ProfileUser,
  Events,
  EventRegister,
  Streaming,
  //TypeZone,
  //CommonZone,
  Times,
  Schedule,
  //Reservation,
  Classified,
  ClassifiedComment,
  ClassifiedLike,
  Management,
  Document,
  DirectoryCollaborator,
  DirectoryEmergency,
  AccountType,
  BankAccount,
  Advertisements,
  DocumentaryCenter,
  DirectoryResidential,
  Rol,
  Bank,
  ManagementReport,
  Rules,
  CurrentlyAssembly,
  HistoryAssembly,
  UploadOrder,
  CommentAssembly,
  Friends,
  Provider,
  CoownershipBudget,
  PowerAssembly,
  ProfileAuth,
])
final Serializers serializers = (_$serializers.toBuilder()
      // ..add(MongoDBSerializer())
      ..add(Iso8601DateTimeSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
