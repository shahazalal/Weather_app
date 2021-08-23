import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_pb/constants.dart';
import 'package:weather_app_pb/helpers.dart';
import 'package:weather_app_pb/provider/weather_provider.dart';

class CurrentPage extends StatefulWidget {
  @override
  _CurrentPageState createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<WeatherProvider>(
        builder: (context, provider, _) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              getFormattedDate(provider.currentModel!.dt!, 'MMMM dd, yyyy'),
              style: txt18w54,
            ),
            Text(
              '${provider.currentModel!.name}, ${provider.currentModel!.sys!.country}',
              style: txt22,
            ),
            // Text(
            //   'Dhaka , BD, ',
            //   style: txt22,
            // ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                    '$icon_prefix${provider.currentModel!.weather![0].icon}$icon_sufix'),
                Text(
                  '${provider.currentModel!.main!.temp!.round()}\u00B0',
                  style: txt60,
                )
              ],
            ),
            Text(
              '${provider.currentModel!.main!.feelsLike!.round()} : 38\u00B0 , Modarate Rain',
              style: txt18,
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${provider.currentModel!.main!.humidity}%',
                      style: txt18,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Humidity',
                      style: txt18,
                    )
                  ],
                ),
                verticalBar,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${provider.currentModel!.main!.pressure}hPa',
                      style: txt18,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Pressure',
                      style: txt18,
                    )
                  ],
                ),
                verticalBar,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${provider.currentModel!.visibility}KM%',
                      style: txt18,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Visibility',
                      style: txt18,
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
