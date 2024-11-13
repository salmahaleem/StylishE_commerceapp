import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stylishecommerce/core/shared/stylishSharedPreferences.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageInitial()){
    getLanguage();
  }

  void getLanguage() async{
     String? languageCode = await StylishSharedPreferences.getLanguage();
     if(languageCode != null){
       emit(LanguageChanged(Locale(languageCode)));
     }else{
       emit(LanguageChanged(Locale('en')));
     }

  }

  Future<void> changeLanguage(String languageCode)async{
    Locale newLocale = Locale(languageCode);
    await StylishSharedPreferences.setLanguage(languageCode);
    emit(LanguageChanged(newLocale));
  }
}
