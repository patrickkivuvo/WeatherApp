import 'package:flutter_riverpod/flutter_riverpod.dart';


final citiesListProvider = StateProvider<List<String>>((ref) {
  return ["Nairobi", "New York", ];
});

final addCityProvider = Provider((ref) => (String city) {
  final currentCities = ref.read(citiesListProvider);
  ref.read(citiesListProvider.state).state = [...currentCities, city];
});