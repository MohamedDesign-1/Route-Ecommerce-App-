import 'package:ecommerce_app/features/auth/login/cubit/login_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_mananger.dart';
import '../../../core/resources/constants_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/resources/styles_manager.dart';
import '../../../core/resources/values_manager.dart';
import '../../../core/routes_manager/routes.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_password_filed.dart';
import '../../../core/widgets/custom_text_filed.dart';
import '../../../core/widgets/shared_pref_utils.dart';
import '../../../core/widgets/validators.dart';
import '../../../domain/di/di.dart';

class LoginScreen extends StatelessWidget {
  LoginViewModelCubit loginViewModelCubit = getIt<LoginViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModelCubit, LoginViewModelState>(
      bloc: loginViewModelCubit,
      listener: (context, state) {
        if (state is LoginViewModelError) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.failure.errorMessage),));
        }
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(AppPadding.p8.h),
          color: ColorManager.primary,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: loginViewModelCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: AppSize.s88.h,),
                  Image.asset(ImageAssets.logo),
                  SizedBox(height: AppSize.s32.h,),
                  Text(
                    'Welcome Back To Route',
                    style: getMediumStyle(
                      fontSize: FontSizeManager.s20.sp,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s16.h,
                  ),
                  Text(
                    'Email Address',
                    style: getMediumStyle(
                      fontSize: FontSizeManager.s20.sp,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s8.h,
                  ),
                  CustomTextFiled(
                    controller: loginViewModelCubit.emailController,
                    validator: AppValidators.validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    suffixIcon: const Icon(Icons.email , color: ColorManager.primary,),
                    hintText: 'Enter your email address',
                    borderRadius: BorderRadius.circular(AppSize.s4),
                  ),
                  SizedBox(
                    height: AppSize.s16.h,
                  ),
                  Text(
                    'Password',
                    style: getMediumStyle(
                      fontSize: FontSizeManager.s20.sp,
                      color: ColorManager.white,
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s8.h,
                  ),
                  CustomPasswordFiled(
                    controller: loginViewModelCubit.passwordController,
                    obscureText: true,
                    validator: AppValidators.validatePassword,
                    hintText: 'Enter your password',
                    borderRadius: BorderRadius.circular(AppSize.s4),
                  ),
                  SizedBox(
                    height: AppSize.s16.h,
                  ),
                  SizedBox(
                    height: AppSize.s24.h,
                  ),
                  BlocBuilder<LoginViewModelCubit, LoginViewModelState>(
                    bloc: loginViewModelCubit,
                    builder: (context, state) {
                      return SpinnerButton(
                        actionText: 'Login Successful',
                        textName: AppConstants.login,
                        buttonColor: ColorManager.white,
                        textColor: ColorManager.primary,
                        isLoading: state is LoginViewModelLoading,
                        isSuccess: state is LoginViewModelSuccess,
                        onPressed: () {
                          loginViewModelCubit.onLoginButtonPressed();
                          Navigator.pushReplacementNamed(context, Routes.mainLayoutRoute);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
