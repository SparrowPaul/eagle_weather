
import 'package:eagle_weather/features/weather/presentation/bloc/weather_bloc.dart';
import 'package:eagle_weather/features/weather/presentation/pages/show_weather.dart';
import 'package:eagle_weather/features/weather/presentation/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    var cityController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child:
          Container(
            child: FlareActor(
              "assets/WorldSpin.flr",
              fit: BoxFit.contain,
              animation: "roll",
            ),
            height: 300,
            width: 300,
          ),
        ),

        BlocBuilder <WeatherBloc, WeatherState>(
          builder: (context, state){
            if (state is WeatherIsNotSearched){
              return SearchWidget(cityController: cityController);
            }
            else if (state is WeatherIsLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherIsLoaded){
              return ShowWeather(state.weather, cityController.text);
            }
            return Text("Error");
          }
        )
      ],
    );
  }
}

