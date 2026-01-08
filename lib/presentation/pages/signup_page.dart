import 'package:flutter/material.dart';
import 'package:weesh/presentation/pages/login_page.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';
import 'package:weesh/presentation/widgets/character_widget.dart';
import 'package:weesh/presentation/widgets/circle_button.dart';
import 'package:weesh/presentation/widgets/text_input_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController classCodeController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height - (MediaQuery.paddingOf(context).top) - (MediaQuery.paddingOf(context).bottom),
          child: Column(
            children: [
              SizedBox(height: 36,),
              Text(
                'Weesh',
                style: AppTextStyles.robotoBlack(size: 32, color: AppColors.primary, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: (MediaQuery.sizeOf(context).height * 0.13) - (MediaQuery.paddingOf(context).top),),
              CharacterWidget(name: 'timid_green'),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.035,),
              Text(
                '회원가입',
                style: AppTextStyles.interBold(size: 26, color: AppColors.primary, lineHeight: 24, letterSpacing: 0),
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.04,),
              // 입력 필드
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 45),
                child: Column(
                  spacing: MediaQuery.sizeOf(context).height * 0.024,
                  children: [
                    TextInputField(hintText: '학번', isPassword: false, controller: classCodeController),
                    TextInputField(hintText: '이름', isPassword: false, controller: nameController),
                    TextInputField(hintText: '아이디', isPassword: false, controller: idController),
                    TextInputField(hintText: '비밀번호', isPassword: true, controller: passwordController),
                  ],
                ),
              ),
              Spacer(),
              // 로그인 회원가입 버튼
              Padding(
                padding: const EdgeInsetsGeometry.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    CircleButton(title: '회원가입', heightPadding: 18, function: () => print('회원가입'),),
                    CircleButton(
                      title: '로그인',
                      heightPadding: 20,
                      function: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),)),
                      unselected: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      )),
    );
  }
}
