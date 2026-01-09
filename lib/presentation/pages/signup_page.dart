import 'package:flutter/material.dart';
import 'package:weesh/domain/entities/auth_field.dart';
import 'package:weesh/domain/enum/login_type.dart';
import 'package:weesh/presentation/mappers/login_type_ui_mapper.dart';
import 'package:weesh/presentation/pages/login_page.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';
import 'package:weesh/presentation/widgets/auth_action_section.dart';
import 'package:weesh/presentation/widgets/auth_input_fields.dart';
import 'package:weesh/presentation/widgets/character_widget.dart';

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

  final fields = [
    AuthField(hintText: '이름', isPassword: false),
    AuthField(hintText: '이메일', isPassword: false),
    AuthField(hintText: '비밀번호', isPassword: true),
    AuthField(hintText: '비밀번호 확인', isPassword: true),
  ];

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
              AuthInputFields(
                fields: fields,
                controllers: [
                  nameController,
                  emailController,
                  passwordController,
                  confirmPasswordController,
                ],
              ),
              Spacer(flex: 3,),
              AuthActionSection(
                actionText: '회원가입',
                navText: '로그인',
                onPrimaryAction: () => print('singup'),
                onNavigation: LoginPage(loginType: widget.loginType,),
              ),
              Spacer(flex: 10,),
            ],
          ),
        ),
      )),
    );
  }
}
