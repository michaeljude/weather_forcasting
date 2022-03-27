import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_forcasting/core/main.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_forcasting/features/home/domain/models/consolidated_weather.dto.dart';
import 'package:weather_forcasting/features/home/domain/models/weather_base_reponse.dto.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.weatherBaseResponseDto}) : super(key: key);

  final WeatherBaseResponseDto weatherBaseResponseDto;

  static Route<dynamic> route({required WeatherBaseResponseDto weatherBaseResponseDto}) =>
      MaterialPageRoute(builder: (BuildContext context) => DetailsScreen(weatherBaseResponseDto: weatherBaseResponseDto));

  @override
  Widget build(BuildContext context) {
    ConsolidatedWeatherDto weatherDto = weatherBaseResponseDto.consolidatedWeatherDto[0];
    final List<String> sunAbbrv = <String>['c', 'lc', 's'];
    bool isSunny = sunAbbrv.contains(weatherDto.weatherStateAbbr);
    return Scaffold(
      backgroundColor: isSunny ? Colors.orange : Colors.blue,
      appBar: AppBar(
        title: Text('Details Screen'),
        backgroundColor: isSunny ? Colors.orange : Colors.blue,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isSunny ? <Color>[Colors.orange, Colors.yellowAccent.shade700] : <Color>[Colors.blue, Colors.blueAccent.shade700],
        )),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Positioned.fill(
              top: 100.h,
              left: 30.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${weatherDto.theTemp.toStringAsFixed(2)}°',
                    style: TextStyle(color: Colors.black, fontSize: 40.sp),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              top: 140.h,
              left: 30.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${weatherDto.weatherStateName}',
                    style: TextStyle(color: Colors.black, fontSize: 25.sp),
                  ),
                ],
              ),
            ),
            Positioned.fill(
              left: 200.w,
              right: 30.w,
              bottom: 200.h,
              child: SvgPicture.network(
                '${imageContentBaseUrl.replaceFirst('abbrv', weatherDto.weatherStateAbbr)}',
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 180.h),
                      child: Text(
                        '${weatherBaseResponseDto.title}',
                        style: TextStyle(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Divider(
                      color: Colors.black,
                      indent: 50,
                      endIndent: 50.w,
                      thickness: 2,
                    ),
                    Text(
                      '$_getDate',
                      style: TextStyle(color: Colors.black, fontSize: 30.sp),
                    ),
                    Text(
                      '$_getTime',
                      style: TextStyle(color: Colors.black, fontSize: 25.sp),
                    ),
                    const SizedBox(height: 50),
                    _ExtraDetails(consolidatedWeatherDto: weatherDto),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get _getDate => DateFormat('MMMM dd, yyyy').format(DateTime.now());

  String get _getTime => DateFormat('hh:mm a').format(DateTime.now());
}

class _ExtraDetails extends StatelessWidget {
  const _ExtraDetails({Key? key, required this.consolidatedWeatherDto}) : super(key: key);

  final ConsolidatedWeatherDto consolidatedWeatherDto;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Wind Speed',
                style: TextStyle(color: Colors.black, fontSize: 25.sp),
              ),
              Text(
                '${consolidatedWeatherDto.windSpeed.toStringAsFixed(2)} m/s',
                style: TextStyle(color: Colors.black, fontSize: 25.sp),
              ),
            ],
          ),
          const SizedBox(width: 15),
          VerticalDivider(
            color: Colors.black,
            thickness: 2,
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Humidity',
                style: TextStyle(color: Colors.black, fontSize: 25.sp),
              ),
              Text(
                '${consolidatedWeatherDto.humidity}%',
                style: TextStyle(color: Colors.black, fontSize: 25.sp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
