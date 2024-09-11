import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc_observer.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'core/widgets/shared_pref_utils.dart';
import 'domain/di/di.dart';
import 'features/main_layout/home_tab/cubit/home_tab_view_model_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefUtils.init();
  var token = SharedPrefUtils.getDate(key: 'token');
  String route ;
  if(token != null) {
    route = Routes.mainLayoutRoute;
  } else {
    route = Routes.loginRoute;

  }
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  runApp(BlocProvider(
      create: (context) => getIt<HomeTabViewModelCubit>()..getAllBrands()..getAllCategories(),
      child: EcommerceApp(route:route,)));
}

class EcommerceApp extends StatelessWidget {
  String route ;
  EcommerceApp({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        home: child,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: route,
      ),
    );
  }
}
