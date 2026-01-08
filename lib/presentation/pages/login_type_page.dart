import 'package:flutter/material.dart';
import 'package:weesh/domain/enum/login_type.dart';
import 'package:weesh/presentation/pages/login_page.dart';
import 'package:weesh/presentation/widgets/character_widget.dart';
import 'package:weesh/presentation/widgets/rect_button.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class LoginTypePage extends StatefulWidget {
  const LoginTypePage({super.key});

  @override
  State<LoginTypePage> createState() => _LoginTypePageState();
}

class _LoginTypePageState extends State<LoginTypePage> {
  LoginType? selectedLoginType;

  void navigateLoginPage() {
    // 타입 저장 로직
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(loginType: selectedLoginType ?? LoginType.student),));
  }

  void changeLoginType(LoginType type) {
    setState(() {
      selectedLoginType = type;
    });
  }

  @override
  Widget build(BuildContext context) {return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.06,),
            CharacterWidget(name: 'timid_green', width: MediaQuery.sizeOf(context).width * 0.12,),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.04,),
            Text(
              '어떤 분이신가요?',
              style: AppTextStyles.interBold(size: 24, color: AppColors.textColor, lineHeight: 24, letterSpacing: 0),
            ),
            Spacer(flex: 5,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 38 - 8),
              child: Row(
                spacing: 40 - 16,
                children: [
                  loginTypeButton('학생', 'student', LoginType.student),
                  loginTypeButton('선생님', 'teacher', LoginType.teacher),
                ],
              ),
            ),
            Spacer(flex: 9,),
            RectButton(
              title: '시작하기',
              function: () => navigateLoginPage(),
              backgroundColor: selectedLoginType == null ? AppColors.lightGrey : AppColors.primary,
              titleColor: selectedLoginType == null ? AppColors.textColor : Colors.white,
            ),
            SizedBox(height: 34,)
          ],
        ),
      )),
    );
  }

  Widget loginTypeButton(String title, String image, LoginType loginType) => Expanded(child: GestureDetector(
    onTap: () => changeLoginType(loginType),
    child: Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Column(
              spacing: 28,
              children: [
                Image.asset('assets/$image.png'),
                Text(title, style: AppTextStyles.robotoSemiBold(size: 20, color: AppColors.primary,),),
              ],
            ),
          ),
        ),
        if(selectedLoginType == loginType) Container(
          alignment: Alignment.center,
          width: 23,
          height: 23,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle
          ),
          child: Icon(Icons.check_rounded, color: Colors.white, size: 16,),
        ),
      ],
    ),
  ),);
}
