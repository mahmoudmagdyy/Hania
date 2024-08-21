import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/services/bloc_observer/bloc_observer.dart';
import 'core/services/notifications/app_notifications_service.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // CrashlyticsService.init();
  await ServiceLocator.init();
  await AppNotificationsService.initNotifications();
  Bloc.observer = AppBlocObserver();
  dioConsumer.updateDeviceTypeHeader();
  runApp(const ProviderScope(child: App()));
}
