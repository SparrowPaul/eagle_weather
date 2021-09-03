import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eagle_weather/data/models/wather_model.dart';
import 'package:eagle_weather/data/repositories/WeatherRepo.dart';
import 'package:equatable/equatable.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;
  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched());




  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    if( event is FetchWeather){
      yield WeatherIsLoading();

      try{
        WeatherModel weather = await weatherRepo.getWeather(event._city);
        yield WeatherIsLoaded(weather);
      }catch(_){
        yield WeatherIsNotLoaded();
      }
    } else if(event is ResetWeather){
      yield WeatherIsNotSearched();
    }
  }
}