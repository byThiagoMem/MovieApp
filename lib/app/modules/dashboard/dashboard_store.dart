import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'dashboard_store.g.dart';

class DashboardStore = _DashboardStoreBase with _$DashboardStore;

abstract class _DashboardStoreBase with Store {
  final pageController = PageController();

  @observable
  int _currentPage = 0;
  int get currentPage => _currentPage;

  @action
  void setCurrentPage(int value) {
    _currentPage = value;
    pageController.jumpToPage(value);
  }
}
