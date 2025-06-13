import 'package:quiick_chat/utils/countries_data.dart';
import 'package:stacked/stacked.dart';

class CountriesSheetModel extends FormViewModel {
  CountryData? _selectedCountry;
  CountryData? get selectedCountry => _selectedCountry;

  void setSelectedCountry(CountryData? country) {
    _selectedCountry = country;
    notifyListeners();
  }

  // Search functionality
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  List<CountryData> _filteredCountries = [];

  List<CountryData> get countries =>
      _isSearching ? _filteredCountries : CountriesData.allCountries;

  void startSearch() {
    _isSearching = true;
    _filteredCountries = CountriesData.allCountries;
    notifyListeners();
  }

  void cancelSearch() {
    _isSearching = false;
    _searchQuery = '';
    notifyListeners();
  }

  void searchCountries(String query) {
    _searchQuery = query;
    _isSearching = query.isNotEmpty;

    if (query.isEmpty) {
      _filteredCountries = CountriesData.allCountries;
    } else {
      _filteredCountries = CountriesData.allCountries
          .where((country) =>
              country.name.toLowerCase().contains(query.toLowerCase()) ||
              country.dialCode.contains(query))
          .toList();
    }

    notifyListeners();
  }
}
