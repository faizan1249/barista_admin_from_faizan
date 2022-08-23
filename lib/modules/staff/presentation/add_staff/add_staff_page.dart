import 'package:barista/core/routings/app_route.dart';
import 'package:barista/core/widgets/base/base_app_bar.dart';
import 'package:barista/core/widgets/base/base_scaffold.dart';
import 'package:barista/core/widgets/button/app_fill_button.dart';
import 'package:barista/core/widgets/card/app_card.dart';
import 'package:barista/core/widgets/input/app_input_field.dart';
import 'package:barista/core/widgets/spacings/app_spacer.dart';
import 'package:barista/core/widgets/utils/row_expanded.dart';
import 'package:barista/modules/staff/presentation/add_staff/add_staff_controller.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddStaffPage extends GetView<AddStaffController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(appBar: _buildTopBar(), body: _buildBody());
  }

  BaseAppBar _buildTopBar() {
    return BaseAppBar(
      title: 'Add Staff',
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
          Container(
            child: InkWell(
              onTap: () async {
                print("Hello");

                // final ImagePicker _picker = ImagePicker();
                // PickedFile? pickedFile =
                //     await ImagePicker().getImage(source: ImageSource.gallery);

                // if (pickedFile != null) {
                //   controller.imageFile = File(pickedFile.path);
                //   print(controller.imageFile);
                // }

                // if (controller.image == null) return;
              },
              child: AppCard(
                  child: Container(
                    // decoration: BoxDecoration(
                    //     image:
                    //         DecorationImage(image: FileImage((controller.image)))),
                    width: 150,
                    height: 150,
                    color: Colors.teal,
                  )),
            ),
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
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: controller.numberController,
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
          verticalSpaceLarge,
          RowExpanded(
            child: AppFilledButton(
                btnText: 'Add Staff',
                onPressed: () async {
                  await controller.addDataToFirebase();
                  print("Add Staff");
                  //Get.back();
                }),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}
