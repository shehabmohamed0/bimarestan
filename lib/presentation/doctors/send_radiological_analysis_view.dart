import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../core/utils/extensions.dart';
import '../../locator/locator.dart';
import '../../shared/app_elevated_button.dart';
import '../auth/app/app_model.dart';
import 'send_radiological_analysis_view_model.dart';

part 'widgets/add_image_button.dart';
part 'widgets/wrap_image.dart';

class SendRadilogicalAnalysisView extends StatelessWidget {
  const SendRadilogicalAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    final profile = context.read<AppModel>().profile!;
    return ChangeNotifierProvider<SendRadiologicalAnalysisViewModel>(
      create: (context) => locator()..init(profile.id),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Send Analysis'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.sp),
          child: Consumer<SendRadiologicalAnalysisViewModel>(
              builder: (context, model, _) {
            return Form(
              key: model.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Images',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.start,
                      spacing: 8,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        for (int index = 0;
                            index < model.images.length;
                            index++)
                          WrapImage(
                            image: model.images[index],
                            onRemove: () => model.unSelectImage(index),
                            onTap: () {},
                          ),
                        AddImageButton(
                          onPressed: model.pickImages,
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      height: 180.h,
                      child: TextFormField(
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        expands: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor:
                              context.colorScheme.primary.withOpacity(0.07),
                          labelText: 'Description',
                          alignLabelWithHint: true,
                          border: const UnderlineInputBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if ((value?.trim() ?? '').isEmpty) {
                            return 'required';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 16.h),
                    AppElevatedButton(
                      onPressed: model.send,
                      child: const Text('Send'),
                    )
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
