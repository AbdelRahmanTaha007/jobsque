import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/controllers/Jobs_cubit/jobs_cubit.dart';
import 'package:jobsque/controllers/LoginCubit/login_cubit_cubit.dart';
import 'package:jobsque/controllers/Profile/profile_cubit.dart';
import 'package:jobsque/controllers/SearchCubit/search_cubit.dart';
import 'package:jobsque/controllers/applied_jobs_cubit/applied_job_cubit.dart';
import 'package:jobsque/controllers/db/offline/shared_helper.dart';
import 'package:jobsque/controllers/db/online/dio_helper.dart';
import 'package:jobsque/controllers/portfolios/portfolios_cubit.dart';
import 'package:jobsque/controllers/saved_jobs/saved_jobs_cubit.dart';
import 'package:jobsque/controllers/signup_cubit/signup_cubit.dart';
import 'package:jobsque/controllers/update_password_cubit/update_password_cubit.dart';
import 'package:jobsque/views/account_done_screen/account_done_screen.dart';
import 'package:jobsque/views/applied_job_screen/applied_job_screen.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_screen_first.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_screen_second.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_screen_third.dart';
import 'package:jobsque/views/apply_job_screen/apply_job_success.dart';
import 'package:jobsque/views/boarding_screen/boarding_screen.dart';
import 'package:jobsque/views/bottom_nav_bar_screen/bottom_nav_bar.dart';
import 'package:jobsque/views/change_password_screen/change_password_screen.dart';
import 'package:jobsque/views/chats_body_screen/chats_body_screen.dart';
import 'package:jobsque/views/check_email_screen/check_email_screen.dart';
import 'package:jobsque/views/edit_profile_screen/edit_profile_screen.dart';
import 'package:jobsque/views/email_address_change/email_address_change.dart';
import 'package:jobsque/views/forgot_password_screen/forgot_password_screen.dart';
import 'package:jobsque/views/help_center_screen/help_center_screen.dart';
import 'package:jobsque/views/home_screen/home_screen.dart';
import 'package:jobsque/views/job_detail_screen/job_detail_screen.dart';
import 'package:jobsque/views/language_screen/language_screen.dart';
import 'package:jobsque/views/login_screen/login_screen.dart';
import 'package:jobsque/views/login_settings/login_settings.dart';
import 'package:jobsque/views/messages_screen/messages_menu_screen.dart';
import 'package:jobsque/views/notification_screen/notification_screen.dart';
import 'package:jobsque/views/password_changed_screen/password_changed_screen.dart';
import 'package:jobsque/views/phone_number_change/phone_number_change.dart';
import 'package:jobsque/views/portfolio_screen/portfolio_screen.dart';
import 'package:jobsque/views/preferred_location_screen/preferred_location_screen.dart';
import 'package:jobsque/views/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:jobsque/views/profile_screen/profile_screen.dart';
import 'package:jobsque/views/reset_password_page/reset_password_screen.dart';
import 'package:jobsque/views/save_job_screen/save_job.dart';
import 'package:jobsque/views/search_screen/search_screen.dart';
import 'package:jobsque/views/settings_notifications_screen/settings_notifications_screen.dart';
import 'package:jobsque/views/signup_interests_screen/signup_interests_screen.dart';
import 'package:jobsque/views/signup_screen/signup_screen.dart';
import 'package:jobsque/views/splash_screen/splash_screen.dart';
import 'package:jobsque/views/terms_conditions_screen/terms_conditions_screen.dart';
import 'package:jobsque/views/two_step_verification_screen/two_step_verification_first.dart';
import 'package:jobsque/views/two_step_verification_screen/two_step_verification_fourth.dart';
import 'package:jobsque/views/two_step_verification_screen/two_step_verification_second.dart';
import 'package:jobsque/views/two_step_verification_screen/two_step_verification_third.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await SharedHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubitCubit()),
        BlocProvider(create: (context) => SignupCubit()),
        BlocProvider(create: (context) => JobsCubit()),
        BlocProvider(create: (context) => ProfileCubit()),
        BlocProvider(create: (context) => SearchCubit()),
        BlocProvider(create: (context) => SavedJobsCubit()),
        BlocProvider(create: (context) => PortfoliosCubit()),
        BlocProvider(create: (context) => AppliedJobCubit()),
        BlocProvider(create: (context) => UpdatePasswordCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(color: Colors.white),
            scaffoldBackgroundColor: Colors.white,
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Color(0xFF3366FF)),
                  foregroundColor: MaterialStatePropertyAll(Colors.white),
                  minimumSize: MaterialStateProperty.all(Size(350.0, 50.0))),
            ),
            textTheme: TextTheme()),
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.route,
        routes: {
          SplashScreen.route: (context) => SplashScreen(),
          BoardingScreen.route: (context) => BoardingScreen(),
          SignupScreen.route: (context) => SignupScreen(),
          SignupInterestsScreen.route: (context) => SignupInterestsScreen(),
          PreferredLocationScreen.route: (context) => PreferredLocationScreen(),
          LoginScreen.route: (context) => LoginScreen(),
          ForgotPasswordScreen.route: (context) => ForgotPasswordScreen(),
          CheckEmailScreen.route: (context) => CheckEmailScreen(),
          AccountDoneScreen.route: (context) => AccountDoneScreen(),
          ResetPassowrdScreen.route: (context) => ResetPassowrdScreen(),
          PasswordChangedScreen.route: (context) => PasswordChangedScreen(),
          HomeScreen.route: (context) => HomeScreen(),
          SearchScreen.route: (context) => SearchScreen(),
          JobDetailScreen.route: (context) => JobDetailScreen(
                compName: "",
                image: "",
              ),
          ApplyJobScreenFirst.route: (context) => ApplyJobScreenFirst(),
          ApplyJobScreenSecond.route: (context) => ApplyJobScreenSecond(),
          ApplyJobScreenThird.route: (context) => ApplyJobScreenThird(),
          ApplyJobScreenSuccess.route: (context) => ApplyJobScreenSuccess(),
          SaveJobScreen.route: (context) => SaveJobScreen(),
          NotificationScreen.route: (context) => NotificationScreen(),
          MessagesMenuScreen.route: (context) => MessagesMenuScreen(),
          ChatsBodyScreen.route: (context) => ChatsBodyScreen(),
          ProfileScreen.route: (context) => ProfileScreen(),
          EditProfileScreen.route: (context) => EditProfileScreen(),
          LanguageScreen.route: (context) => LanguageScreen(),
          PortfolioScreen.route: (context) => PortfolioScreen(),
          NotificationSettingsScreen.route: (context) =>
              NotificationSettingsScreen(),
          LoginSettings.route: (context) => LoginSettings(),
          EmailChangeScreen.route: (context) => EmailChangeScreen(),
          PhoneNumberChangeScreen.route: (context) => PhoneNumberChangeScreen(),
          ChangePasswordScreen.route: (context) => ChangePasswordScreen(),
          TwoStepVerificationFirst.route: (context) =>
              TwoStepVerificationFirst(),
          TwoStepVerificationSecond.route: (context) =>
              TwoStepVerificationSecond(),
          TwoStepVerificationThird.route: (context) =>
              TwoStepVerificationThird(),
          TwoStepVerificationFourth.route: (context) =>
              TwoStepVerificationFourth(),
          HelpCenterScreen.route: (context) => HelpCenterScreen(),
          TermsConditionsScreen.route: (context) => TermsConditionsScreen(),
          PrivacyPolicyScreen.route: (context) => PrivacyPolicyScreen(),
          AppliedJobScreen.route: (context) => AppliedJobScreen(),
          BottomNavBarScreen.route: (context) => BottomNavBarScreen(),
        },
      ),
    );
  }
}
