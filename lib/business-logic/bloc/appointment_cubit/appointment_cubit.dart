import 'package:bloc/bloc.dart';
import 'package:e_consulting_flutter/business-logic/bloc/appointment_cubit/appointment_states.dart';
import 'package:e_consulting_flutter/data/remote/dio_helper.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentCubit extends Cubit<AppointmentStates>
{

  AppointmentCubit() : super(BookAppointmentInitialState());

  static AppointmentCubit get(context) => BlocProvider.of(context);

  void bookAppointment({
    required String date,
    required String start,
    required int consultantId,
    required int clientId,
  }) {
    DioHelper.postData(url: 'appointment/book', data: {
      'date' : date,
      'appointmentStart' : start,
      'consultantId' : consultantId,
      'clientId' : clientId
    });
  }
}