abstract class StatesApp{}
class InitStatesApp extends StatesApp{}
class ChangeButtonStatesApp extends StatesApp{}
class PasswordStatesApp extends StatesApp{}
class LoadingBusinessStatesApp extends StatesApp{}
class GetDataBusinessSuccessStatesApp extends StatesApp{}
class GetDataBusinessErrorStatesApp extends StatesApp{

  String error;

  GetDataBusinessErrorStatesApp({this.error});
}
class LoadingSportsStatesApp extends StatesApp{}
class GetDataSportsSuccessStatesApp extends StatesApp{}
class GetDataSportsErrorStatesApp extends StatesApp{

  String error;

  GetDataSportsErrorStatesApp({this.error});
}
class LoadingScienceStatesApp extends StatesApp{}
class GetDataScienceSuccessStatesApp extends StatesApp{}
class GetDataScienceErrorStatesApp extends StatesApp{

  String error;

  GetDataScienceErrorStatesApp({this.error});
}
class LoadingSearchStatesApp extends StatesApp{}
class GetDataSearchSuccessStatesApp extends StatesApp{}
class GetDataSearchErrorStatesApp extends StatesApp{

  String error;

  GetDataSearchErrorStatesApp({this.error});
}

class ChangeThemeStatesApp extends StatesApp{}
