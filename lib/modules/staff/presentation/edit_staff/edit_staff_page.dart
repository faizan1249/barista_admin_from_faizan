import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/input/app_input_field.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'edit_staff_controller.dart';

class EditStaffPage extends GetView<EditStaffController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: _buildTopBar(),
      body: _buildBody(),
    );
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'Edit Staff',
      leadingIcon: IconButton(
        icon: Icon(Icons.arrow_back_ios_rounded),
        onPressed: () => Get.back(),
      ),
    );
  }

  Widget _buildBody() {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          verticalSpaceMedium,
          InkWell(
            onTap: () async {
              final ImagePicker _picker = ImagePicker();
              final XFile? image =
              await _picker.pickImage(source: ImageSource.gallery);
            },
            child: AppCard(
                child: Container(
                  width: 150,
                  height: 150,
                  color: Colors.teal,
                )),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'First Name',
            hintText: 'First Name',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: controller.firstNameController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Last Name',
            hintText: 'Last Name',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            controller: controller.lastNameController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            enabled: false,
            title: 'Email',
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            controller: controller.emailController,
            validator:
            ValidationBuilder().email('Please enter valid email').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Age',
            hintText: 'Age',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: controller.ageController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          AppInputField(
            title: 'Phone Number',
            hintText: 'Phone Number',
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.done,
            controller: controller.numberController,
            validator:
            ValidationBuilder().required('This field is required').build(),
          ),
          verticalSpaceRegular,
          Obx(() {
            return AppInputField(
              enableInteractiveSelection: false,
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
          verticalSpaceLarge,
          RowExpanded(
            child: AppFilledButton(
                btnText: 'Save Changes',
                onPressed: () async {
                  Map<String, dynamic> data = {
                    'fname': controller.firstNameController.value.text
                        .toString()
                        .trim(),
                    'lname': controller.lastNameController.value.text
                        .toString()
                        .trim(),
                    'email':
                    controller.emailController.value.text.toString().trim(),
                    'age':
                    controller.ageController.value.text.toString().trim(),
                    'phone_number': controller.numberController.value.text
                        .toString()
                        .trim(),
                    'password': controller.passwordController.value.text
                        .toString()
                        .trim(),
                  };

                  controller.updateStaffInfo(
                    controller.emailController.value.text.toString().trim(),
                    data,
                  );
                }),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}
