import 'package:barista/modules/auth/presentation/login_binding.dart';
import 'package:barista/modules/auth/presentation/login_page.dart';
import 'package:barista/modules/category/presentation/add_category/add_category_binding.dart';
import 'package:barista/modules/category/presentation/add_category/add_category_page.dart';
import 'package:barista/modules/category/presentation/category_selection/category_binding.dart';
import 'package:barista/modules/category/presentation/category_selection/category_page.dart';
import 'package:barista/modules/category/presentation/edit_category/edit_category_binding.dart';
import 'package:barista/modules/category/presentation/edit_category/edit_category_page.dart';
import 'package:barista/modules/category/presentation/view_category/view_category_binding.dart';
import 'package:barista/modules/category/presentation/view_category/view_category_page.dart';
import 'package:barista/modules/dashboard/presentation/dashboard_binding.dart';
import 'package:barista/modules/dashboard/presentation/dashboard_page.dart';
import 'package:barista/modules/history/presentation/history_binding.dart';
import 'package:barista/modules/history/presentation/history_page.dart';
import 'package:barista/modules/product/presentation/add_product/add_product_binding.dart';
import 'package:barista/modules/product/presentation/add_product/add_product_page.dart';
import 'package:barista/modules/product/presentation/edit_product/edit_product_binding.dart';
import 'package:barista/modules/product/presentation/edit_product/edit_product_page.dart';
import 'package:barista/modules/product/presentation/product_selection/product_binding.dart';
import 'package:barista/modules/product/presentation/product_selection/product_page.dart';
import 'package:barista/modules/product/presentation/view_product/view_product_binding.dart';
import 'package:barista/modules/product/presentation/view_product/view_product_controller.dart';
import 'package:barista/modules/product/presentation/view_product/view_product_page.dart';
import 'package:barista/modules/splash/presentation/splash_binding.dart';
import 'package:barista/modules/splash/presentation/splash_page.dart';
import 'package:barista/modules/staff/presentation/add_staff/add_staff_binding.dart';
import 'package:barista/modules/staff/presentation/add_staff/add_staff_page.dart';
import 'package:barista/modules/staff/presentation/edit_staff/edit_staff_binding.dart';
import 'package:barista/modules/staff/presentation/edit_staff/edit_staff_page.dart';
import 'package:barista/modules/staff/presentation/staff_selection/staff_binding.dart';
import 'package:barista/modules/staff/presentation/staff_selection/staff_page.dart';
import 'package:barista/modules/staff/presentation/view_staff/view_staff_binding.dart';
import 'package:barista/modules/staff/presentation/view_staff/view_staff_page.dart';
import 'package:get/get.dart';

abstract class Routes {
  static const initial = '/splash';

  //Login
  static const login = '/login';

  //Category
  static const category = '/category';
  static const addCategory = '/add-category';
  static const editCategory = '/edit-category';
  static const viewCategory = '/view-category';

  //Dashboard
  static const dashboard = '/dashboard';

  //History
  static const history = '/history';

  //Product
  static const product = '/product';
  static const addProduct = '/add-Product';
  static const editProduct = '/edit-Product';
  static const viewProduct = '/view-Product';

  //Staff
  static const staff = '/staff';
  static const addStaff = '/add-staff';
  static const editStaff = '/edit-staff';
  static const viewStaff = '/view-staff';
}

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.initial,
        page: () => SplashPage(),
        binding: SplashBinding()),
    GetPage(
        name: Routes.login,
        page: () => LoginPage(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.category,
        page: () => CategoryPage(),
        binding: CategoryBinding()),
    GetPage(
        name: Routes.dashboard,
        page: () => DashboardPage(),
        binding: DashboardBinding()),
    GetPage(
        name: Routes.history,
        page: () => HistoryPage(),
        binding: HistoryBinding()),
    GetPage(
        name: Routes.product,
        page: () => ProductPage(),
        binding: ProductBinding()),
    GetPage(
        name: Routes.staff,
        page: () => StaffPage(),
        binding: StaffBinding()),
    GetPage(
        name: Routes.addProduct,
        page: () => AddProductPage(),
        binding: AddProductBinding()),
    GetPage(
        name: Routes.editProduct,
        page: () => EditProductPage(),
        binding: EditProductBinding()),
    GetPage(
        name: Routes.viewProduct,
        page: () => ViewProductPage(),
        binding: ViewProductBinding()),
    GetPage(
        name: Routes.addCategory,
        page: () => AddCategoryPage(),
        binding: AddCategoryBinding()),
    GetPage(
        name: Routes.editCategory,
        page: () => EditCategoryPage(),
        binding: EditCategoryBinding()),
    GetPage(
        name: Routes.viewCategory,
        page: () => ViewCategoryPage(),
        binding: ViewCategoryBinding()),
    GetPage(
        name: Routes.addStaff,
        page: () => AddStaffPage(),
        binding: AddStaffBinding()),
    GetPage(
        name: Routes.editStaff,
        page: () => EditStaffPage(),
        binding: EditStaffBinding()),
    GetPage(
        name: Routes.viewStaff,
        page: () => ViewStaffPage(),
        binding: ViewStaffBinding()),
  ];
}
