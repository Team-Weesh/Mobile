import 'package:flutter/material.dart';
import 'package:weesh/domain/enum/login_type.dart';
import 'package:weesh/presentation/mappers/login_type_ui_mapper.dart';
import 'package:weesh/presentation/pages/login_page.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';
import 'package:weesh/presentation/widgets/character_widget.dart';
import 'package:weesh/presentation/widgets/circle_button.dart';
import 'package:weesh/presentation/widgets/rect_button.dart';
import 'package:weesh/presentation/widgets/text_input_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key, required this.loginType});

  final LoginType loginType;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - (MediaQuery.paddingOf(context).top) - (MediaQuery.paddingOf(context).bottom),
          child: Column(
            children: [
              SizedBox(height: (MediaQuery.sizeOf(context).height * 0.03),),
              Text(
                'Weesh',
                style: AppTextStyles.robotoBlack(
                  size: 32,
                  color: AppColors.primary,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: (MediaQuery.sizeOf(context).height * 0.13) - (MediaQuery.paddingOf(context).top),),
              CharacterWidget(name: 'happy_green', width: MediaQuery.sizeOf(context).width * 0.13,),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.045,),
              Text(
                '${widget.loginType.label} 회원가입',
                style: AppTextStyles.interBold(size: 22, color: AppColors.textColor, lineHeight: 22, letterSpacing: 0),
              ),
              Spacer(flex: 4,),
              inputFields(),
              Spacer(flex: 3,),
              loginAndSignupButton(),
              Spacer(flex: 10,),
            ],
          ),
        ),
      )),
    );
  }

  Widget inputFields() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 45),
    child: Column(
      spacing: MediaQuery.sizeOf(context).height * 0.024,
      children: [
        TextInputField(hintText: '이름', isPassword: false, controller: nameController),
        TextInputField(hintText: '이메일', isPassword: true, controller: emailController),
        TextInputField(hintText: '비밀번호', isPassword: true, controller: passwordController),
        TextInputField(hintText: '비밀번호 확인', isPassword: true, controller: confirmPasswordController),
      ],
    ),
  );

  Widget loginAndSignupButton() => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Column(
      spacing: 26,
      children: [
        RectButton(
          title: '회원가입',
          function: () => print('signup'),
          backgroundColor: AppColors.lightGrey,
          titleColor: AppColors.textColor,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignupPage(loginType: widget.loginType,),)),
          child: Text(
            '로그인',
            style: AppTextStyles.robotoRegular(
              size: 14,
              color: AppColors.textColor,
            ),
          ),
        ),
      ],
    ),
  );
}
