import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weatherapp/providers/WeatherProvider.dart';
import 'package:weatherapp/utils/Utils.dart';


class WeatherScreen extends ConsumerStatefulWidget {
  const WeatherScreen({Key? key, required this.city}) : super(key: key);

  final String city;

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}
class _WeatherScreenState extends ConsumerState<WeatherScreen> {
@override
  void initState() {
  ref.read(cityProvider.state).state = widget.city;

}
  @override
  Widget build(BuildContext context) {
    // Change the city dynamically
    final weatherAsyncValue = ref.watch(weatherProvider);


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
          foregroundColor: Colors.white,
        ),
        body: weatherAsyncValue.when(
          data: (weatherInfo) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
                        Image.asset('assets/icons/${weatherInfo[0].icon}.png', height: 200, fit: BoxFit.fill,),

                        Text(widget.city, style: Theme.of(context).textTheme.displayLarge,),
                        const SizedBox(height: 5,),
                        Text("H: ${weatherInfo[0].max}°   L: ${weatherInfo[0].min}°", style: Theme.of(context).textTheme.displaySmall,),
                        const SizedBox(height: 2,),
                        Text("${weatherInfo[0].temperature} | ${weatherInfo[0].weatherDescription}", style: Theme.of(context).textTheme.displayMedium,)
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text("Clouds", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),),

                                    const SizedBox(height: 2,),
                                    Text("75 % ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),)
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(.2),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text("Pressure", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),),

                                    const SizedBox(height: 2,),
                                    Text("1018 ", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),)
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text("Humidity", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),),

                                    const SizedBox(height: 2,),
                                    Text("91", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),)
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),
                      Expanded(child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.transparent.withOpacity(.1),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    Text("Wind", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),),

                                    const SizedBox(height: 2,),
                                    Text("4.28 kph", style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white),)
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      )),
                    ],
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: weatherInfo.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final dailyInfo = weatherInfo[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width * .8,
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      Text(formatDate(dailyInfo.date), style: Theme.of(context).textTheme.displayMedium,)
                                    ],
                                  ),
                                )),
                                Image.asset('assets/icons/${dailyInfo.icon}.png', height: 100, fit: BoxFit.fill,)
                              ],
                            ),

                          ),
                        );

                      },
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
        ),


      ),
    );
  }
}