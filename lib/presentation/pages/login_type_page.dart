import 'package:flutter/material.dart';
import 'package:weesh/presentation/pages/login_page.dart';
import 'package:weesh/presentation/widgets/character_widget.dart';
import 'package:weesh/presentation/widgets/circle_button.dart';

import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';

class LoginTypePage extends StatefulWidget {
  const LoginTypePage({super.key});

  @override
  State<LoginTypePage> createState() => _LoginTypePageState();
}

class _LoginTypePageState extends State<LoginTypePage> {
  String selectedLoginType = '';

  void navigateLoginPage() {
    // 타입 저장 로직
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
  }

  void changeLoginType(String type) {
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
              padding: EdgeInsetsGeometry.symmetric(horizontal: 38 - 8),
              child: Row(
                spacing: 40 - 16,
                children: [
                  loginTypeButton('학생', 'student'),
                  loginTypeButton('선생님', 'teacher'),
                ],
              ),
            ),
            Spacer(flex: 9,),
            GestureDetector(
              onTap: () => navigateLoginPage(),
              child: Container(
                alignment: AlignmentGeometry.center,
                margin: EdgeInsetsGeometry.symmetric(horizontal: 35),
                width: double.infinity,
                height: 47,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedLoginType == '' ? AppColors.lightGrey : AppColors.primary,
                ),
                child: Text(
                  '시작하기',
                  style: AppTextStyles.robotoSemiBold(size: 16, color: selectedLoginType == '' ? AppColors.textColor : Colors.white),
                ),
              ),
            ),
            SizedBox(height: 34,)
          ],
        ),
      )),
    );
  }

  Widget loginTypeButton(String title, String image) => Expanded(child: GestureDetector(
    onTap: () => changeLoginType(image),
    child: Stack(
      alignment: AlignmentGeometry.topRight,
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
        if(selectedLoginType == image) Container(
          alignment: AlignmentGeometry.center,
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
