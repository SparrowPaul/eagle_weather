part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  const WeatherState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

// class WeatherInitial extends WeatherState {
// }

class WeatherIsNotSearched extends WeatherState {
}

class WeatherIsLoading extends WeatherState {

}

class WeatherIsLoaded extends WeatherState {
  final _weather;

  WeatherIsLoaded(this._weather);
  @override
  // TODO: implement props
  List<Object?> get props => [_weather];

  get weather => _weather;
}

class WeatherIsNotLoaded extends WeatherState {  // use in cases of error
}