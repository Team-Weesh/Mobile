import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weesh/presentation/pages/login_type_page.dart';
import 'package:weesh/presentation/theme/app_colors.dart';
import 'package:weesh/presentation/theme/app_text_styles.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(Duration(seconds: 1));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginTypePage(),));
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/weesh_light.png', width: MediaQuery.sizeOf(context).width * 0.3,),
            SizedBox(height: 42,),
            Text(
              'Weesh',
              style: AppTextStyles.robotoBlack(size: MediaQuery.sizeOf(context).height * 0.075, color: AppColors.primary, fontStyle: FontStyle.italic),
            ),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.15,),
          ],
        ),
      )),
    );
  }
}
