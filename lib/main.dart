import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hipal/components/Management/advertisements/bloc/advertisements_bloc.dart';
import 'package:hipal/components/Management/advertisements/bloc/management%20Reports/managementReports_bloc.dart';
import 'package:hipal/components/Management/advertisements/repository/advertisements_repository.dart';
import 'package:hipal/components/Management/advertisements/repository/managementReport_repository.dart';
import 'package:hipal/components/Management/advertisements/ui/screens/advertisementsScreen.dart';
import 'package:hipal/components/Management/attentionResident/bloc/directoryCollaborator_bloc.dart';
import 'package:hipal/components/Management/attentionResident/repository/directoryCollaborator_repository.dart';
import 'package:hipal/components/Management/attentionResident/ui/attention_resident.dart';
import 'package:hipal/components/Management/bankAccounts/bloc/bankAccount_bloc.dart';
import 'package:hipal/components/Management/bankAccounts/repository/bank_accounts_repository.dart';
import 'package:hipal/components/Management/bankAccounts/ui/bank_accounts.dart';
import 'package:hipal/components/Management/informationManagement/bloc/management_bloc.dart';
import 'package:hipal/components/Management/informationManagement/repository/management_repository.dart';
import 'package:hipal/components/Management/informationManagement/ui/screen/information_management.dart';
import 'package:hipal/components/apartment/ui/apartment.dart';
import 'package:hipal/components/assembly/bloc/assemblyComment/assembly_comment_bloc.dart';
import 'package:hipal/components/assembly/bloc/assemblyComment/form_assemblyComment_bloc.dart';
import 'package:hipal/components/assembly/bloc/currentlyAssembly/currentlyAssembly_bloc.dart';
import 'package:hipal/components/assembly/bloc/historyAssembly/historyAssembly_bloc.dart';
import 'package:hipal/components/assembly/bloc/powerAssembly/formpower_bloc.dart';
import 'package:hipal/components/assembly/bloc/powerAssembly/powers_bloc.dart';
import 'package:hipal/components/assembly/bloc/rulesAssembly/rules_bloc.dart';
import 'package:hipal/components/assembly/repository/assembly_comment_repository.dart';
import 'package:hipal/components/assembly/repository/assembly_power_repository.dart';
import 'package:hipal/components/assembly/repository/assembly_repository.dart';
import 'package:hipal/components/assembly/ui/screens/callsAssemblyAndMeetings.dart';
import 'package:hipal/components/auth/login/bloc/login_bloc.dart';
import 'package:hipal/components/auth/login/repository/login_repository.dart';
import 'package:hipal/components/auth/login/ui/login_view.dart';
import 'package:hipal/components/auth/recovery/bloc/recovery_bloc.dart';
import 'package:hipal/components/auth/recovery/repository/recovery_repository.dart';
import 'package:hipal/components/auth/recovery/ui/recovery_view.dart';
import 'package:hipal/components/chats/bloc/chats_bloc.dart';
import 'package:hipal/components/chats/bloc/profiles_bloc.dart';
import 'package:hipal/components/chats/repository/chats_repository.dart';
import 'package:hipal/components/chats/repository/profiles_repository.dart';
import 'package:hipal/components/chats/ui/screens/chats.dart';
import 'package:hipal/components/classifieds/bloc/classified/classifieds_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classified/formclassified_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedComment/classified_comment_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedLike/classifieds_like_bloc.dart';
import 'package:hipal/components/classifieds/bloc/classifiedLike/formclassified_like_bloc.dart';
import 'package:hipal/components/classifieds/repository/classified_comment_repository.dart';
import 'package:hipal/components/classifieds/repository/classified_like_repository.dart';
import 'package:hipal/components/classifieds/repository/classifieds_repository.dart';
import 'package:hipal/components/classifieds/ui/screens/classifieds_screen.dart';
import 'package:hipal/components/commonZones/bloc/common_zones_bloc.dart';
import 'package:hipal/components/commonZones/bloc/schedule_bloc/schedule_bloc.dart';
import 'package:hipal/components/commonZones/repository/common_zones_repository.dart';
import 'package:hipal/components/commonZones/ui/screens/common_zones_screen.dart';
import 'package:hipal/components/coownership_budget/bloc/coownership_bloc.dart';
import 'package:hipal/components/coownership_budget/ui/screens/coownership_screen.dart';
import 'package:hipal/components/dashboard/ui/dashboard.dart';
import 'package:hipal/components/delivery/bloc/addres_deliveries_bloc/address_deliveries_bloc.dart';
import 'package:hipal/components/delivery/bloc/comment_bloc/comment_bloc.dart';
import 'package:hipal/components/delivery/bloc/comment_bloc/formcomment_bloc.dart';
import 'package:hipal/components/delivery/bloc/deliveries_bloc/deliveries_bloc.dart';
import 'package:hipal/components/delivery/repository/address_deliveries_repository.dart';
import 'package:hipal/components/delivery/repository/comment_repository.dart';
import 'package:hipal/components/delivery/repository/deliveries_repository.dart';
import 'package:hipal/components/directory/bloc/directory_bloc.dart';
import 'package:hipal/components/directory/repository/directory_repository.dart';
import 'package:hipal/components/directory/ui/screens/directory_screen.dart';
import 'package:hipal/components/documentaryCenter/bloc/documentarycenter_bloc.dart';
import 'package:hipal/components/documentaryCenter/repository/documentaryCenter_repository.dart';
import 'package:hipal/components/documentaryCenter/ui/screens/screen_documentarycenter.dart';
import 'package:hipal/components/employees/bloc/employees_bloc.dart';
import 'package:hipal/components/employees/bloc/formemployee_bloc.dart';
import 'package:hipal/components/employees/repository/employees_repository.dart';
import 'package:hipal/components/employees/ui/screens/employees.dart';
import 'package:hipal/components/events/bloc/event_register/event_register_bloc.dart';
import 'package:hipal/components/events/bloc/events_bloc.dart';
import 'package:hipal/components/events/repository/event_register_repository.dart';
import 'package:hipal/components/events/repository/events_repository.dart';
import 'package:hipal/components/events/ui/screens/screen_events.dart';
import 'package:hipal/components/families/bloc/families_bloc.dart';
import 'package:hipal/components/families/bloc/formfamily_bloc.dart';
import 'package:hipal/components/families/repository/families_repository.dart';
import 'package:hipal/components/families/ui/screens/families.dart';
import 'package:hipal/components/friends/bloc/friends_bloc.dart';
import 'package:hipal/components/friends/repository/friends_repository.dart';
import 'package:hipal/components/hipal/screens/screen_hipal.dart';
import 'package:hipal/components/lostObjects/bloc/lost_object_bloc.dart';
import 'package:hipal/components/lostObjects/repository/lost_objects_repository.dart';
import 'package:hipal/components/lostObjects/ui/screens/lost_objects_screens.dart';
import 'package:hipal/components/messages/bloc/messages_bloc.dart';
import 'package:hipal/components/messages/repository/messages_repository.dart';
import 'package:hipal/components/messages/ui/screens/messages.dart';
import 'package:hipal/components/myservices/bloc/service_bloc.dart';
import 'package:hipal/components/myservices/repository/service_repository.dart';
import 'package:hipal/components/notifications/bloc/notifications_bloc.dart';
import 'package:hipal/components/notifications/repository/notifications_repository.dart';
import 'package:hipal/components/notifications/ui/screens/notifications.dart';
import 'package:hipal/components/onboardingAppHipal/ui/screen/onboarding_app_one.dart';
import 'package:hipal/components/onboardingWallet/bloc/register_cubit.dart';
import 'package:hipal/components/onboardingWallet/ui/screen/onboarding_screen.dart';
import 'package:hipal/components/onboardingWallet/ui/screen/password_recovery_screen_one.dart';
import 'package:hipal/components/onboardingWallet/ui/screen/process_wallet_screen.dart';
import 'package:hipal/components/onboardingWallet/ui/screen/type_document_screen.dart';
import 'package:hipal/components/onboardingWallet/ui/screen/wallet_login_screen.dart';
import 'package:hipal/components/pets/bloc/formpet_bloc.dart';
import 'package:hipal/components/pets/bloc/pets_bloc.dart';
import 'package:hipal/components/pets/repository/pets_repository.dart';
import 'package:hipal/components/pets/ui/screens/pets.dart';
import 'package:hipal/components/publications/bloc/provider_bloc.dart';
import 'package:hipal/components/publications/bloc/publication_bloc.dart';
import 'package:hipal/components/publications/bloc/publications_by_residential_bloc.dart';
import 'package:hipal/components/publications/repository/provider_repository.dart';
import 'package:hipal/components/publications/repository/publication_repository.dart';
import 'package:hipal/components/publications/ui/screens/screen_publications.dart';
import 'package:hipal/components/resident_experience/bloc/resident_experience_bloc.dart';
import 'package:hipal/components/resident_experience/repository/resident_experience_repository.dart';
import 'package:hipal/components/resident_experience/ui/screens/resident%20experience_screen.dart';
import 'package:hipal/components/sos/bloc/sos_bloc.dart';
import 'package:hipal/components/sos/repository/sos_repository.dart';
import 'package:hipal/components/sos/ui/screens/sos.dart';
import 'package:hipal/components/splash/ui/splash.dart';
import 'package:hipal/components/streaming/bloc/streamings_bloc.dart';
import 'package:hipal/components/streaming/repository/streamings_repository.dart';
import 'package:hipal/components/streaming/ui/screens/streaming_screen.dart';
import 'package:hipal/components/user/bloc/user_bloc.dart';
import 'package:hipal/components/user/ui/screens/edit_user.dart';
import 'package:hipal/components/user/ui/screens/user.dart';
import 'package:hipal/components/vehicles/bloc/formvehicle_bloc.dart';
import 'package:hipal/components/vehicles/bloc/vehicles_bloc.dart';
import 'package:hipal/components/vehicles/repository/vehicles_repository.dart';
import 'package:hipal/components/vehicles/ui/screens/vehicles.dart';
import 'package:hipal/components/visitors/bloc/formvisit_bloc.dart';
import 'package:hipal/components/visitors/bloc/visitors_bloc.dart';
import 'package:hipal/components/visitors/repository/visitors_repository.dart';
import 'package:hipal/components/visitors/ui/screens/visit_screen.dart';
import 'package:hipal/components/wallet/bloc/waller_administration_payable_user_bloc.dart';
import 'package:hipal/components/wallet/ui/screen/recharge_phone.dart';
import 'package:hipal/components/wallet/ui/screen/wallet_administration_payable_user_screen.dart';
import 'package:hipal/environment/environment.dart';
import 'package:hipal/firebase_options.dart';
import 'package:hipal/locale/my_messages_timeago.dart';
import 'package:hipal/services/notification_service.dart';
import 'package:hipal/theme.dart';
import 'package:hipal/utils/new-version.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'components/ads/bloc/ads_bloc.dart';
import 'components/ads/repository/ads_repository.dart';
import 'components/ads/ui/screens/screen_ads.dart';
import 'components/apartment/bloc/property_cubit.dart';
import 'components/apartment/repository/apartament_repository.dart';
import 'components/assembly/ui/screens/general_assembly_screen.dart';
import 'components/assembly/ui/screens/listHistoryAssembly.dart';
import 'components/assembly/ui/screens/pageAssembly.dart';
import 'components/assembly/ui/screens/welcome_assembly.dart';
import 'components/assembly/ui/widgets/meeting_assembly.dart';
import 'components/assembly/ui/widgets/power_assembly_form.dart';
import 'components/assembly/ui/widgets/rules_assembly.dart';
import 'components/auth/login/ui/logout_view.dart';
import 'components/commonZones/ui/screens/my_reservations_screen.dart';
import 'components/coownership_budget/repository/coownership_repository.dart';
import 'components/delivery/bloc/addres_deliveries_bloc/address_deliveries_bloc.dart';
import 'components/delivery/bloc/deliveries_bloc/deliveries_bloc.dart';
import 'components/delivery/bloc/deliveries_bloc/formdelivery_bloc.dart'
    as FormDeliveryBloc;
import 'components/delivery/repository/address_deliveries_repository.dart';
import 'components/delivery/repository/deliveries_repository.dart';
import 'components/delivery/ui/screens/deliveries.dart';
import 'components/locker/bloc/lockers_bloc.dart';
import 'components/locker/repository/locker_repository.dart';
import 'components/locker/ui/screens/screen_locker.dart';
import 'components/myservices/bloc/form_service_bloc.dart';
import 'components/onboardingAppHipal/ui/screen/information_onboarding_app.dart';
import 'components/onboardingAppHipal/ui/screen/recovery_code_app.dart';
import 'components/onboardingAppHipal/ui/screen/register_user_app.dart';
import 'components/onboardingWallet/repository/onboarding_register_repository.dart';
import 'components/onboardingWallet/ui/screen/password_recovery_screen.dart';
import 'components/onboardingWallet/ui/screen/password_recovery_screen_end.dart';
import 'components/onboardingWallet/ui/screen/password_recovery_screen_two.dart';
import 'components/onboardingWallet/ui/screen/register_screen.dart';
import 'components/user/repository/user_repository.dart';
import 'components/user/ui/screens/widgets/edit_password.dart';
import 'components/version_check/version_check.dart';
import 'components/wallet/ui/screen/other_banck.dart';
import 'components/wallet/ui/screen/recharge_digital_content.dart';
import 'components/wallet/ui/screen/recharge_sport_bets.dart';
import 'components/wallet/ui/screen/wallet_screen.dart';
import 'components/wallet/ui/screen/withdraw_atm_success.dart';
import 'components/wallet/ui/screen/withdraw_cash.dart';
import 'components/wallet/ui/screen/withdraw_cash_success.dart';
import 'components/wallet/ui/screen/withdraw_correspondent.dart';
import 'components/wallet/ui/screen/withdraw_correspondent_atm.dart';
import 'components/wallet/ui/screen/withdraw_correspondent_code.dart';

void main() async {
  timeago.setLocaleMessages('es', MyMessagesTimeAgo());
  final newVersion = NewVersion(
    iOSId: 'com.hipal.co.hipal',
    androidId: 'com.hipal.co.hipal',
  );
  var status;
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.DEV,
  );
  Environment().initConfig(environment);
  await init();
  final statusResponse = await advancedStatusCheck(newVersion, status);
  if (statusResponse != null && environment == Environment.PROD) {
    final local = (statusResponse as VersionStatus).localVersion;
    final store = (statusResponse as VersionStatus).storeVersion;

    bool statusCheck = false;
    try {
      List<String> localArray = local.split(".");
      List<String> storeArray = store.split(".");
      int localVersionNumber = int.parse(localArray[0]) * 10000 + int.parse(localArray[1]) * 100 + int.parse(localArray[2]);
      int storeVersionNumber = int.parse(storeArray[0]) * 10000 + int.parse(storeArray[1]) * 100 + int.parse(storeArray[2]);
      statusCheck = storeVersionNumber > localVersionNumber;
    } catch (err) {
      statusCheck = false;
    }
    runApp(AppHipal(statusCheck, statusResponse.storeVersion));
  } else {
    await runZonedGuarded(
      () async {
        await BlocOverrides.runZoned(
          () async => runApp(AppHipal(false, '0.0.0.0')),
        );
      },
      (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
    );
  }
}

Future init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

advancedStatusCheck(newVersion, status) async {
  final status = await newVersion.getVersionStatus();
  if (status != null) {
    return status;
  } else {
    return null;
  }
}

class AppHipal extends StatelessWidget {
  AppHipal(this.statusUpdate, this.versionUpdate);

  final bool statusUpdate;
  final String versionUpdate;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc(loginRepo: LoginRepository())),
        BlocProvider(
            create: (_) => RecoveryBloc(recoveryRepo: RecoveryRepository())),
        BlocProvider(
            create: (_) =>
                PublicationBloc(publicationRepo: PublicationRepository())),
        BlocProvider(
            create: (_) =>
                PublicationsBloc(publicationRepo: PublicationRepository())),
        BlocProvider(
            create: (_) => PublicationsByResidentialBloc(
                publicationRepo: PublicationRepository())),
        BlocProvider(
            create: (_) => ProviderBloc(providerRepo: ProviderRepository())),
        BlocProvider(create: (_) => PetsBloc(petsRepo: PetsRepository())),
        BlocProvider(create: (_) => FormpetBloc(petsRepo: PetsRepository())),
        BlocProvider(
            create: (_) => FamiliesBloc(familiesRepo: FamiliesRepository())),
        BlocProvider(
            create: (_) => FormfamilyBloc(familiesRepo: FamiliesRepository())),
        BlocProvider(
            create: (_) => VehiclesBloc(vehiclesRepo: VehiclesRepository())),
        BlocProvider(
            create: (_) => FormvehicleBloc(vehiclesRepo: VehiclesRepository())),
        BlocProvider(
            create: (_) => EmployeesBloc(employeesRepo: EmployeesRepository())),
        BlocProvider(
            create: (_) =>
                FormemployeeBloc(employeesRepo: EmployeesRepository())),
        BlocProvider(create: (_) => UserBloc(userRepo: UserRepository())),
        BlocProvider(
            create: (_) =>
                DeliveriesBloc(deliveriesRepo: DeliveriesRepository())),
        BlocProvider(
            create: (_) => FormDeliveryBloc.FormdeliveryBloc(
                deliveriesRepository: DeliveriesRepository())),
        BlocProvider(
            create: (_) => AddressDeliveriesBloc(
                addresDeliveriesRepo: AddreesDeliveriesRepository())),
        BlocProvider(
            create: (_) => LockersBloc(lockerRepo: LockerRepository())),
        BlocProvider(
            create: (_) => ServiceBloc(serviceRepo: ServiceRepository())),
        BlocProvider(
            create: (_) => FormServiceBloc(serviceRepo: ServiceRepository())),
        BlocProvider(
            create: (_) => CommentBloc(commentRepo: CommentRepository())),
        BlocProvider(
            create: (_) => FormcommentBloc(commentRepo: CommentRepository())),
        BlocProvider(
            create: (_) =>
                VisitorsBloc(visitorsRepository: VisitorsRepository())),
        BlocProvider(
            create: (_) => FormvisitBloc(visitorsRepo: VisitorsRepository())),
        BlocProvider(create: (_) => ChatsBloc(chatsRepo: ChatsRepository())),
        BlocProvider(
            create: (_) => MessagesBloc(
                messagesRepo: MessagesRepository(),
                chatsRepo: ChatsRepository())),
        BlocProvider(
            create: (_) => ProfilesBloc(profilesRepo: ProfilesRepository())),
        BlocProvider(
            create: (_) =>
                LostObjectBloc(lostObjectsRepo: LostObjectsRepository())),
        BlocProvider(create: (_) => EventsBloc(eventsRepo: EventsRepository())),
        BlocProvider(
            create: (_) => EventRegisterBloc(
                eventRegisterRepo: EventRegisterRepository())),
        BlocProvider(
            create: (_) =>
                StreamingBloc(streamingsRepo: StreamingsRepository())),
        BlocProvider(
            create: (_) => ResidentExperienceBloc(
                residentExperienceRepo: ResidentExperienceRepository())),
        BlocProvider(
            create: (_) =>
                ScheduleBloc(commonZonesRepo: CommonZonesRepository())),
        BlocProvider(
            create: (_) =>
                CommonZonesBloc(commonZonesRepo: CommonZonesRepository())),
        BlocProvider(
            create: (_) => DirectoryBloc(directoryRepo: DirectoryRepository())),
        BlocProvider(
            create: (_) => NotificationsBloc(
                notificationsRepo: NotificationsRepository())),
        BlocProvider(
            create: (_) => DocumentarycenterBloc(
                documentaryCenterRepo: DocumentaryCenterRepository())),
        BlocProvider(
            create: (_) => ClassifiedsBloc(
                classifiedsRepo: ClassifiedsRepository(),
                publicationsBloc: PublicationsBloc(
                    publicationRepo: PublicationRepository()))),
        BlocProvider(
            create: (_) =>
                FormclassifiedBloc(classifiedsRepo: ClassifiedsRepository())),
        BlocProvider(
            create: (_) => ClassifiedsLikeBloc(
                classifiedsLikeRepo: ClassifiedsLikeRepository())),
        BlocProvider(
            create: (_) => FormclassifiedLikeBloc(
                classifiedsLikeRepo: ClassifiedsLikeRepository())),
        BlocProvider(
            create: (_) => ClassifiedCommentBloc(
                classifiedCommentRepo: ClassifiedCommentRepository())),
        BlocProvider(
            create: (_) =>
                ManagementBloc(managementRepository: ManagementRepository())),
        BlocProvider(
            create: (_) => DirectoryCollaboratorBloc(
                directoryCollaboratorRepo: DirectoryCollaboratorRepository())),
        BlocProvider(
            create: (_) => SosBloc(
                sosRepo: SosRepository(),
                messagesRepo: MessagesRepository(),
                chatsRepo: ChatsRepository())),
        BlocProvider(
            create: (_) =>
                BankAccountBloc(bankAccountsRepo: BankAccountsRepository())),
        BlocProvider(
            create: (_) => AdvertisementsBloc(
                advertisementsRepo: AdvertisementsRepository())),
        BlocProvider(
            create: (_) => ManagementReportsBloc(
                managementReportsRepo: ManagementReportsRepository())),
        BlocProvider(
            create: (_) => FriendsBloc(friendsRepo: FriendsRepository())),
        BlocProvider(
            create: (_) =>
                CurrentlyAssemblyBloc(assemblyRepo: AssemblyRepository())),
        BlocProvider(create: (_) => AdsBloc(adsRepo: AdsRepository())),
        BlocProvider(
            create: (_) =>
                HistoryAssemblyBloc(assemblyRepo: AssemblyRepository())),
        BlocProvider(
            create: (_) => AssemblyCommentBloc(
                assemblyCommentRepo: AssemblyCommentRepository())),
        BlocProvider(
            create: (_) => FormAssemblycommentBloc(
                assemblyCommentRepo: AssemblyCommentRepository())),
        BlocProvider(
            create: (_) =>
                CoownershipBloc(coownershipRepo: CoownershipRepository())),
        BlocProvider(create: (_) => RulesBloc(rulesRepo: AssemblyRepository())),
        BlocProvider(create: (_) => PowersBloc(powersRepo: PowersRepository())),
        BlocProvider(
            create: (_) => FormpowerBloc(powersRepo: PowersRepository())),
        BlocProvider(
            create: (_) =>
                PropertyCubit(apartamentRepository: ApartamentRepository())),
        BlocProvider(
            create: (_) => WallerAdministrationPayableUserCubic(
                WallerAdministrationPayableUserState())),
        BlocProvider(
            create: (_) => RegisterCubit(
                registerRepository: OnboardingRegisterRepository())),
      ],
      child: MyAppHipal(statusUpdate, versionUpdate),
    );
  }
}

class MyAppHipal extends StatelessWidget {
  MyAppHipal(this.statusUpdate, this.versionUpdate);

  final bool statusUpdate;
  final String versionUpdate;
  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
      footerBuilder: () => ClassicFooter(
        loadStyle: LoadStyle.ShowWhenLoading,
        loadingIcon: CircularProgressIndicator(color: Color(0xff8639D8)),
      ),
      child: OverlaySupport(
        toastTheme: ToastThemeData(background: Colors.white),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Hipal',
            initialRoute: statusUpdate ? 'check-version' : 'splash',
            routes: {
              'check-version': (context) =>
                  VersionChecked(statusUpdate, versionUpdate),
              'recovery-password': (context) => RecoveryPasswordScreen(),
              'splash': (context) => SplashScreen(),
              'login': (context) => LoginScreen(),
              'logout': (context) => LogoutScreen(),
              'dashboard': (context) => DashboardScreen(),
              'apartment': (context) => ApartmentScreen(),
              'pets': (context) => PetsScreen(),
              'families': (context) => FamiliesScreen(),
              'vehicles': (context) => VehiclesScreen(),
              'employees': (context) => EmployeesScreen(),
              'user': (context) => UserScreen(),
              'edit-user': (context) => EditUserScreen(),
              'password-user': (context) => EditPasswordScreen(),
              'delivery': (context) => DeliveryScreens(),
              'locker': (context) => ScreenLocker(),
              //'publication': (context) => ScreenPublication(),
              'publications': (context) => ScreenPublications(),
              'chat': (context) => ChatsScreen(),
              'messages': (context) => MessagesScreen(),
              'visit': (context) => VisitScreen(),
              'lost-objects': (context) => LostObjectScren(),
              'common-zones': (context) => CommonZonesScreen(),
              'events': (context) => ScreenEvents(),
              'my-reservations': (context) => MyReservationsScreen(),
              'streaming': (context) => StreamingsScreen(),
              'resident-experience': (context) => ResidentExperienceScreen(),
              'clasificados': (context) => ClassifiedsScreen(),
              'administration': (context) => InformationManagement(),
              'atentionResident': (context) => AttentionResisdent(),
              'directory': (context) => DirectoryScreen(),
              'notification': (context) => NotificationsScreen(),
              'sos': (context) => SOSScreen(),
              'banckAccounts': (context) => BankAccounts(),
              'advertisementsScreen': (context) => AdvertisementsScreen(),
              'documentary-center': (context) => ScreenDocumentaryCenter(),
              'hipal': (context) => ScreenHipal(),
              'coownership': (context) => CoownershipScreen(),
              'callsAndMeeting': (context) => AssemblyAndMeeting(),
              'adsScreen': (context) => ScreenAds(),
              'wallet': (context) => WalletScreen(),
              'onboardingWallet': (context) => OnboardingWalletScreen(),
              'onboardingAppHipal': (context) => OnboardingAppOne(),
              'recoveryOnboardingAppHipal': (context) => PasswordRecoveryApp(),
              'informationOnboardingAppHipal': (context) => InfoOnboardingApp(),
              'RegisterAppScreen': (context) => RegisterAppScreen(),
              'processWallet': (context) => ProcessWalletScreen(),
              'processInitialWallet': (context) => TypeDocumentScreen(),
              'registerWallet': (context) => RegisterWalletScreen(),
              'loginWallet': (context) => WalletLoginScreen(),
              'recoveryWallet': (context) => PasswordRecoveryWallet(),
              'recoveryWalletOne': (context) => PasswordRecoveryWalletOne(),
              'recoveryWalletTwo': (context) => PasswordRecoveryWalletTwo(),
              'recoveryWalletEnd': (context) => PasswordRecoveryWalletEnd(),
              'walletAdminPayableUser': (context) =>
                  WalletAdministrationPayableUserScreen(),
              'other-banks': (context) => OtherBankScreen(),
              'withdrawCorrespondent': (context) => WithdrawCorrespondent(),
              'withdrawcorrespondentcode': (context) =>
                  WithdrawCorrespondentCode(),
              'withdrawatm': (context) => WithdrawAtm(),
              'withdrawatmsuccess': (context) => WithdrawAtmSuccess(),
              'withdrawcash': (context) => WithdrawCash(),
              'withdrawcashsuccess': (context) => WithdrawCashSuccess(),
              'recharge-phone': (context) => RechargePhoneScreen(),
              'recharge-digital-content': (context) => RechargeDigitalContent(),
              'sport-bets-screen': (context) => SportBetsScreen(),
              'assembly-screen': (context) => PageAssembly(),
              'power-form': (context) => PowerForm(),
              'history-assembly': (context) => HistoryAssembly(),
              'meeting-assembly': (context) => MeetingAssembly(),
              'rules-assembly': (context) => RulesAssembly(),
              'welcome-assembly': (context) => WelcomeAssembly(),
              'gral-assembly-screen': (context) => GralAssemblyScreen(),
            },
            scaffoldMessengerKey: NotificationService.messengerKey,
            localizationsDelegates: [
              RefreshLocalizations.delegate,
              // this line is important
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('es'),
              Locale('en', ''),
            ],
            theme: lightThemeData(context)),
      ),
    );
  }
}
