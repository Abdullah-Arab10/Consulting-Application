// ignore_for_file: prefer_const_constructors

import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_cubit.dart';
import 'package:e_consulting_flutter/business-logic/bloc/home_cubit/home_states.dart';
import 'package:e_consulting_flutter/main.dart';
import 'package:e_consulting_flutter/presentation/pages/auth/login_screen.dart';
import 'package:e_consulting_flutter/presentation/themes/colors.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_button.dart';
import 'package:e_consulting_flutter/presentation/widgets/default_form_field.dart';
import 'package:e_consulting_flutter/presentation/widgets/navigate_to.dart';
import 'package:e_consulting_flutter/presentation/widgets/show_toast.dart';
import 'package:e_consulting_flutter/utils/helpers/images_converter_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import 'package:e_consulting_flutter/generated/l10n.dart';
import '../../../business-logic/bloc/locale_cubit/locale_cubit.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var t = S.of(context);
        var image = ImageConverter.dataFromBase64String(ImageConverter.bigestGG);
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              title: Text(
                cubit.titles[2],
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
          ),
          drawer: Drawer(
            backgroundColor: AppColors.backgroundColor,
            elevation: 0.0,
            child: BlocBuilder<LocaleCubit, ChangeLocaleState>(
              builder: (context, state) {
                if (state is ChangeLocaleState) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top:100),
                    child: Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Application Language',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,

                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<LocaleCubit>(context)
                                    .changeLanguage('en');
                              },
                              child: Text('ENGLISH'),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 200,
                            child: ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<LocaleCubit>(context)
                                    .changeLanguage('ar');
                              },
                              child: Text('Arabic'),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  bottom: 10
                                ),
                                child: defaultButton(
                                    text: t.logout,
                                  function: ()
                                  {
                                    showToast(text: t.logoutSuccess, state: ToastStates.SUCCESS);
                                    navigateTo(context, LoginScreen());
                                  },
                                  width: 200,
                                  color: AppColors.errorColor,
                                  radius: 50
                                ),
                              )
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 80,
                          backgroundColor: AppColors.primaryColor,
                        ),
                        CircleAvatar(
                            radius: 77,
                            backgroundImage: MemoryImage(image),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                          initial: 'Ali',
                          enable: false,
                          label: 'First Name',
                          prefix: Icons.first_page,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: defaultFormField(
                          initial: 'Fadel',
                          enable: false,
                          label: 'Last Name',
                          prefix: Icons.last_page,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: 'ali@gmail.com',
                    enable: false,
                    label: 'Email Address',
                    prefix: Icons.email,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: 'nabek',
                    enable: false,
                    label: 'Address',
                    prefix: Icons.house_outlined,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: '09999999999',
                    enable: false,
                    label: 'Phone',
                    prefix: Icons.phone,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: defaultFormField(
                          initial: '1:30',
                          enable: false,
                          label: 'Shift Start',
                          prefix: Icons.calendar_today_outlined,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: defaultFormField(
                          initial: '3:30',
                          enable: false,
                          label: 'Shift End',
                          prefix: Icons.calendar_today_outlined,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: 'bio',
                    enable: false,
                    label: 'Bio',
                    prefix: Icons.details,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultFormField(
                    initial: 'consultation type',
                    enable: false,
                    label: 'Consultation',
                    prefix: Icons.merge_type,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
