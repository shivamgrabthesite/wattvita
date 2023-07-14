import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeatherCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Weather Forecast',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Temperature Chart',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 300,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0, // Remove the border around the plot area
                primaryXAxis: CategoryAxis(
                  isVisible: false, // Hide the x-axis
                ),
                primaryYAxis: NumericAxis(
                  isVisible: false, // Hide the y-axis
                ),
                series: <ChartSeries>[
                  LineSeries<WeatherData, String>(
                    name: "asasasasas",
                    color: Colors.black,
                    isVisible: true,
                    dataSource: <WeatherData>[
                      WeatherData('Mon', 30, 'Sunny', Icon(Icons.abc), '8:00 AM - 4:00 PM'),
                      WeatherData('Tue', 25, 'Cloudy', Icon(Icons.abc), '9:00 AM - 3:00 PM'),
                      WeatherData('Wed', 32, 'Rainy', Icon(Icons.abc), '10:00 AM - 5:00 PM'),
                      WeatherData('Thu', 28, 'Cloudy', Icon(Icons.abc), '11:00 AM - 2:00 PM'),
                      WeatherData('Fri', 34, 'Sunny', Icon(Icons.abc), '7:00 AM - 6:00 PM'),
                      WeatherData('Sat', 30, 'Partly Cloudy', Icon(Icons.abc), '8:00 AM - 4:00 PM'),
                      WeatherData('Sun', 32, 'Sunny', Icon(Icons.abc), '9:00 AM - 5:00 PM'),
                    ],
                    xValueMapper: (WeatherData data, _) => data.day,
                    yValueMapper: (WeatherData data, _) => data.temperature,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.bottom,
                      textStyle: TextStyle(fontSize: 12),
                      color: Colors.black,
                      builder: (data, point, series, pointIndex, seriesIndex) {
                        WeatherData weatherData = data;
                        return Column(
                          children: [
                            Text(
                              '${weatherData.temperature}°C',
                              style: TextStyle(color: Colors.black),
                            ),
                            weatherData.imagePath,
                            // Image.asset(
                            //   weatherData.imagePath,
                            //   width: 16,
                            //   height: 16,
                            // ),
                            Text(weatherData.timeline),
                          ],
                        );
                      },
                    ),
                    markerSettings: MarkerSettings(height: 20, width: 20, color: Colors.black),
                    enableTooltip: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherData {
  WeatherData(this.day, this.temperature, this.weatherCondition, this.imagePath, this.timeline);
  final String day;
  final double temperature;
  final String weatherCondition;
  final Icon imagePath;
  final String timeline;
}
