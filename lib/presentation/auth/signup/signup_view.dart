import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../locator/locator.dart';
import '../../../shared/app_elevated_button.dart';
import '../../../shared/password_text_form_field.dart';
import 'sigup_view_model.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignupViewModel>(
      create: (context) => locator(),
      child: Scaffold(
        body: ColoredBox(
          color: ColorManager.primary,
          child: SafeArea(
            child: ColoredBox(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 210.h,
                      color: ColorManager.primary,
                      child: Image.asset(
                        ImageAssets.logo_white,
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 48.w),
                      child: Consumer<SignupViewModel>(
                        builder: (context, model, _) {
                          return Form(
                            key: model.formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 16.h),
                                TextFormField(
                                  controller: model.name,
                                  decoration: const InputDecoration(
                                    labelText: 'Name',
                                    alignLabelWithHint: true,
                                  ),
                                  validator: FormBuilderValidators.required(),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                SizedBox(height: 4.h),
                                TextFormField(
                                  controller: model.email,
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    alignLabelWithHint: true,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email(),
                                  ]),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                SizedBox(height: 4.h),
                                PasswordTextFormField(
                                  controller: model.password,
                                  labelText: 'Password',
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.minLength(6),
                                  ]),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                SizedBox(height: 4.h),
                                InternationalPhoneNumberInput(
                                  textFieldController: model.phone,
                                  inputDecoration: const InputDecoration(
                                      labelText: 'Phone number'),
                                  onInputChanged: model.phoneNumberChanged,
                                  selectorConfig: const SelectorConfig(
                                    selectorType: PhoneInputSelectorType.DIALOG,
                                    setSelectorButtonAsPrefixIcon: true,
                                    leadingPadding: 8,
                                  ),
                                  countries: const ['EG'],
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (p0) {
                                    return model.validPhoneNumber
                                        ? null
                                        : 'Invalid phone number';
                                  },
                                ),
                                SizedBox(height: 4.h),
                                TextFormField(
                                  controller: model.age,
                                  decoration: const InputDecoration(
                                    labelText: 'Age',
                                    alignLabelWithHint: true,
                                  ),
                                  validator: FormBuilderValidators.compose([
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.integer(),
                                  ]),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                SizedBox(height: 4.h),
                                TextFormField(
                                  controller: model.address,
                                  decoration: const InputDecoration(
                                    labelText: 'Address',
                                    alignLabelWithHint: true,
                                  ),
                                  validator: FormBuilderValidators.required(),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                SizedBox(height: 4.h),
                                TextFormField(
                                  controller: model.description,
                                  decoration: const InputDecoration(
                                    labelText: 'description',
                                    alignLabelWithHint: true,
                                  ),
                                  maxLines: null,
                                  keyboardType: TextInputType.multiline,
                                  validator: FormBuilderValidators.required(),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                ),
                                SizedBox(height: 32.h),
                                AppElevatedButton(
                                  height: 60.h,
                                  onPressed: model.submit,
                                  child: Text(
                                    'Create account',
                                    style: TextStyle(fontSize: 20.sp),
                                  ),
                                ),
                                SizedBox(height: 32.h),
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
