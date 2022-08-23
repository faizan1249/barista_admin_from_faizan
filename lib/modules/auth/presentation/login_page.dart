import 'package:barista/core/constant/app_colors.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/input/app_checkbox_form_field.dart';
import 'package:barista/core/widgets/input/app_input_field.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/text/app_text.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/auth/presentation/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body: _buildLoginForm());
  }

  Widget _buildLoginForm() {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpaceMedium,
          AppText.headingOne(
            'Login',
            color: kcPrimaryColor,
          ),
          verticalSpaceMedium,
          AppInputField(
            title: 'Email / Username',
            hintText: 'Enter email/username',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: controller.emailController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          Obx(() {
            return AppInputField(
              title: 'Password',
              hintText: 'min. 8 characters',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              controller: controller.passwordController,
              validator: ValidationBuilder()
                  .minLength(8, 'Password must be at least 8 characters long')
                  .build(),
              obscureText: controller.isPasswordObscure.value,
              suffixIcon: IconButton(
                icon: Icon(controller.isPasswordObscure.value
                    ? Icons.visibility_off_outlined
                    : Icons.remove_red_eye_outlined),
                onPressed: () {
                  controller.onShowOrHidePasswordPressed();
                },
              ),
            );
          }),
          verticalSpaceSmall,
          AppCheckboxListTileFormField(
            title: 'Keep me logged in',
            onChanged: (value) {
              controller.onKeepLoginChanged(value);
            },
          ),
          verticalSpaceLarge,
          RowExpanded(
            child: AppFilledButton(
                btnText: 'Login',
                onPressed: () => controller.onLoginPressed(
                  controller.emailController.value.text.toString().trim(),
                  controller.passwordController.value.text
                      .toString()
                      .trim(),
                )),
          ),
        ],
      ),
    );
  }
}
