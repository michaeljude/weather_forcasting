import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_forcasting/core/main.dart';
import 'package:weather_forcasting/core/widgets/loading_container.dart';
import 'package:weather_forcasting/features/details/details_screen.dart';
import 'package:weather_forcasting/features/home/domain/bloc/home_bloc.dart';
import 'package:weather_forcasting/features/home/domain/bloc/home_state.dart';
import 'package:weather_forcasting/features/home/domain/repository/home_repository.dart';
import 'package:weather_forcasting/generated/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static Route<dynamic> route() => MaterialPageRoute(builder: (BuildContext context) => HomeScreen());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBloc(context.read<HomeRepository>()),
      child: _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {},
      builder: (BuildContext context, HomeState state) => Scaffold(
        body: Container(
            width: double.infinity,
            color: Colors.blue,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: state.isLoading ? LoadingContainer() : _HomeBody(state: state),
            )),
      ),
    );
  }
}

class _HomeBody extends StatefulWidget {
  const _HomeBody({Key? key, required this.state}) : super(key: key);

  final HomeState state;

  @override
  __HomeBodyState createState() => __HomeBodyState();
}

class __HomeBodyState extends State<_HomeBody> {
  late CarouselController _carouselController;

  @override
  void initState() {
    _carouselController = CarouselController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Assets.images.emerson.image(),
          SizedBox(height: 25.h),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.circular(20)),
            child: Text(
              'Simple Weather App',
              style: TextStyle(color: Colors.white, fontSize: 25.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 50.h),
          (widget.state.viewModel.weatherBaseResponseDto?.length ?? 0) != 0
              ? CarouselSlider.builder(
                  itemCount: widget.state.viewModel.weatherBaseResponseDto?.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CarouselItem(
                        state: widget.state,
                        index: index,
                      ),
                    );
                  },
                  carouselController: _carouselController,
                  options: CarouselOptions(
                    autoPlay: true,
                    disableCenter: true,
                    enlargeCenterPage: true,
                  ))
              : Text(
                  'There`s no weather forcast today 😞',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.sp, fontWeight: FontWeight.bold),
                ),
        ],
      ),
    );
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem({Key? key, required this.state, required this.index}) : super(key: key);

  final HomeState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    String abbrv = state.viewModel.weatherBaseResponseDto?[index].consolidatedWeatherDto[0].weatherStateAbbr ?? '';
    return GestureDetector(
      onTap: () {
        if (state.viewModel.weatherBaseResponseDto?[index] != null) {
          Navigator.of(context).push(DetailsScreen.route(weatherBaseResponseDto: state.viewModel.weatherBaseResponseDto![index]));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: <BoxShadow>[
          BoxShadow(color: Colors.black.withOpacity(.1), offset: Offset(7, 2)),
          BoxShadow(color: Colors.black.withOpacity(.1), offset: Offset(4, 7)),
        ]),
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Text(
              state.viewModel.weatherBaseResponseDto?[index].title ?? '',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 110.w),
                  child: Text(
                    state.viewModel.weatherBaseResponseDto?[index].consolidatedWeatherDto[0].weatherStateName ?? 'No Weather',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 3),
                if (abbrv.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: WeatherAbbr(
                      abbr: state.viewModel.weatherBaseResponseDto![index].consolidatedWeatherDto[0].weatherStateAbbr,
                    ),
                  )
              ],
            ),
            const SizedBox(height: 20),
            if (abbrv.isNotEmpty)
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Hero(
                    tag: 'weather_states-$abbrv',
                    child: SvgPicture.network(
                      '${imageContentBaseUrl.replaceFirst('abbrv', abbrv)}',
                      height: 80.h,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class WeatherAbbr extends StatelessWidget {
  const WeatherAbbr({Key? key, required this.abbr}) : super(key: key);

  final String abbr;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
      child: Text(
        abbr,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
