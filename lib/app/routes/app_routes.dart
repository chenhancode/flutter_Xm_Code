part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const TABS = _Paths.TABS;
  static const PRODUCT_LIST = _Paths.PRODUCT_LIST;
}

abstract class _Paths {
  _Paths._();
  static const TABS = '/tabs';
  static const PRODUCT_LIST = '/product-list';
}
