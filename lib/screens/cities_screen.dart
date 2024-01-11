import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp/providers/CitiesProvider.dart';
import 'package:weatherapp/providers/CitiesWeatherProvider.dart';
import 'package:weatherapp/providers/WeatherProvider.dart';
import 'package:weatherapp/screens/weather_screen.dart';


class CitiesScreen extends ConsumerWidget {
  const CitiesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsyncValue = ref.watch(weatherProvider);
    final weatherDataListAsyncValue = ref.watch(weatherDataListProvider);

    final cities = ref.watch(citiesListProvider);
    print(cities.length);
    print(cities[0]);
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Color.fromRGBO(37, 42, 96, 1),
            Color.fromRGBO(30, 29, 60, 1),
          ],
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text('My cities', style: Theme.of(context).textTheme.displayMedium),
          ),
        ),


        body:  weatherDataListAsyncValue.when(
          data: (weatherDataList) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: weatherDataList.length,
                      itemBuilder: (context, index) {
                        final dailyInfo = weatherDataList[index].dailyWeatherInfo;
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: InkWell(
                            onTap: (){
                              ref.read(cityProvider.state).state = weatherDataList[index].city;
                              print("Next screen : ${ref.read(cityProvider).toString()}");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (__) => WeatherScreen(city: weatherDataList[index].city)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Color.fromRGBO(48, 38, 124, 1),
                                      Color.fromRGBO(55, 54, 88, 1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: [
                                  Expanded(child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("${dailyInfo.temperature}°", style: Theme.of(context).textTheme.displayLarge,),
                                        const SizedBox(height: 5,),
                                        Text("H: ${dailyInfo.max}°   L: ${dailyInfo.min}°", style: Theme.of(context).textTheme.displaySmall,),
                                        const SizedBox(height: 2,),
                                        Text(weatherDataList[index].city, style: Theme.of(context).textTheme.displayMedium,)
                                      ],
                                    ),
                                  )),
                                  Image.asset('assets/icons/${dailyInfo.icon}.png', height: 100, fit: BoxFit.fill,)
                                ],
                              ),

                            ),
                          ),
                        );

                      },
                    ),
                  ),
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text("Error: $error")),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.white,
              elevation: 8,
              onPressed: () {
                // Show a dialog to get the new item
                showDialog(
                  context: context,
                  builder: (context) {
                    final TextEditingController controller = TextEditingController();
                    return AlertDialog(
                      title: Text('Add City',  style: Theme.of(context).textTheme.displayLarge?.copyWith(color: Colors.white)),
                      backgroundColor: const Color.fromRGBO(37, 42, 96, 1),
                      content: TextField(
                        controller: controller,
                        decoration: const InputDecoration(hintText: 'Enter city name', hintStyle: TextStyle(color: Colors.white)),
                        cursorColor: Colors.white,
                        style:  const TextStyle(color: Colors.white),

                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () {



                            ref.read(addCityProvider)(controller.text);
                            Navigator.pop(context);
                          },
                          child: Text('Add', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white)),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Icon(Icons.add, color: Color.fromRGBO(30, 29, 60, 1),),
            ),
          ],
        ),
      ),
    );
  }
}