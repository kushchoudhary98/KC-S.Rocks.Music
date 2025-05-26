import 'package:flutter/material.dart';
import 'package:s_rocks_music/models/service.dart';
import 'package:s_rocks_music/services/home_service.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeService _homeService = HomeService();

  bool _loading = false;
  List<ServiceModel> _services = [];

  bool get loading => _loading;
  List<ServiceModel> get services => _services;

  HomeViewModel() {
    fetchServices();
  }

  Future<void> fetchServices() async {
    _loading = true;
    notifyListeners();

    _services = await _homeService.fetchHomeServices();

    _loading = false;
    notifyListeners();
  }
}
