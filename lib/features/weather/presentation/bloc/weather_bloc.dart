import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eagle_weather/features/weather/data/models/wather_model.dart';
import 'package:eagle_weather/features/weather/data/repositories/WeatherRepo.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched()) {

    on<WeatherEvent>((event, emit) async {
      return emit (WeatherIsLoading());
    });

    on<FetchWeather>((event, emit) async {
      try{
        WeatherModel weather = await weatherRepo.getWeather(event._city);
        return emit (WeatherIsLoaded(weather));
      }catch(_){
        return emit (WeatherIsNotLoaded());
      }
    });

    on<ResetWeather>((event, emit) async {
      return emit (WeatherIsNotSearched());
    });
  }



// @override
// Stream<WeatherState> mapEventToState(
//   WeatherEvent event,
// ) async* {
//   if( event is FetchWeather){
//     yield WeatherIsLoading();
//
//     try{
//       WeatherModel weather = await weatherRepo.getWeather(event._city);
//       yield WeatherIsLoaded(weather);
//     }catch(_){
//       yield WeatherIsNotLoaded();
//     }
//   } else if(event is ResetWeather){
//     yield WeatherIsNotSearched();
//   }
// }
}
