import 'package:dio/dio.dart';
import 'package:dio_http_formatter/dio_http_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:weather_forcasting/core/domain/splash/splash_screen.dart';
import 'package:weather_forcasting/features/home/domain/repository/home_repository.dart';
import 'package:weather_forcasting/features/home/domain/repository/home_repository_impl.dart';
import 'package:weather_forcasting/features/home/domain/service/home_api_service.dart';

String contentBaseUrl = 'https://www.metaweather.com/';
String imageContentBaseUrl = '$contentBaseUrl/static/img/weather/abbrv.svg';

Logger logger = Logger(
  filter: ProductionFilter(),
  printer: PrettyPrinter(),
  output: ConsoleOutput(),
);
void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late Dio _dio;

  @override
  void initState() {
    _dio = Dio();

    _dio.interceptors.add(HttpFormatter(logger: logger));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<HomeRepository>.value(value: HomeRepositoryImpl(apiService: HomeApiService(_dio))),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 667),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'WeatherForcasting',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen(),
        ),
      ),
    );
  }
}
