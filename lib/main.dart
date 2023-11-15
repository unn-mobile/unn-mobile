import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injector/injector.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:unn_mobile/app.dart';
import 'package:unn_mobile/core/services/implementations/auth_data_provider_impl.dart';
import 'package:unn_mobile/core/services/implementations/authorisation_service_impl.dart';
import 'package:unn_mobile/core/services/implementations/authorisation_refresh_service_impl.dart';
import 'package:unn_mobile/core/services/implementations/get_schedule_service_impl.dart';
import 'package:unn_mobile/core/services/implementations/offline_schedule_provider_impl.dart';
import 'package:unn_mobile/core/services/implementations/search_id_on_portal_service_impl.dart';
import 'package:unn_mobile/core/services/implementations/storage_service_impl.dart';
import 'package:unn_mobile/core/services/interfaces/auth_data_provider.dart';
import 'package:unn_mobile/core/services/interfaces/authorisation_service.dart';
import 'package:unn_mobile/core/services/interfaces/authorisation_refresh_service.dart';
import 'package:unn_mobile/core/services/interfaces/getting_schedule_service.dart';
import 'package:unn_mobile/core/services/interfaces/offline_schedule_provider.dart';
import 'package:unn_mobile/core/services/interfaces/search_id_on_portal_service.dart';
import 'package:unn_mobile/core/services/interfaces/storage_service.dart';
import 'package:unn_mobile/core/viewmodels/auth_page_view_model.dart';
import 'package:unn_mobile/core/viewmodels/loading_page_view_model.dart';
import 'package:unn_mobile/core/viewmodels/main_page_view_model.dart';
import 'package:unn_mobile/core/viewmodels/schedule_screen_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  registerDependencies();
  await initializeDateFormatting('ru_RU', null);
  runApp(const UnnMobile());
}

void registerDependencies() {
  var injector = Injector.appInstance;
  // register all the dependencies here:
  injector.registerSingleton<StorageService>(() => StorageServiceImpl());
  injector.registerSingleton<AuthorisationService>(() => AuthorisationServiceImpl());
  injector.registerSingleton<AuthDataProvider>(() => AuthDataProviderImpl());
  injector.registerSingleton<AuthorisationRefreshService>(() => AuthorisationRefreshServiceImpl());
  injector.registerSingleton<SearchIdOnPortalService>(() => SearchIdOnPortalServiceImpl());
  injector.registerSingleton<GetScheduleService>(() => GetScheduleServiceImpl());
  injector.registerSingleton<OfflineScheduleProvider>(() => OfflineScheduleProviderImpl());
  
  injector.registerDependency(() => LoadingPageViewModel());
  injector.registerDependency(() => AuthPageViewModel());
  injector.registerDependency(() => MainPageViewModel());
  injector.registerDependency(() => ScheduleScreenViewModel());
}
