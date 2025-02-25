
  
  

void configureGetItApp() {
    
    getLoginConfigure();
    getCharactersConfigure();
  // Revisar el main, ya que se debe agregar el siguiente código para que funcione correctamente
  // home: FutureBuilder(future: GetIt.instance.allReady(),(...)


}

//Ejemplo de configuración Getit de alguna dependencia
void getLoginConfigure() {
  //dependencias necesarias para el módulo de login. Ejemplo:


  //GetIt.instance.registerLazySingleton<ApiService>(() => ApiService(dioClient));

  //repositories
  //GetIt.instance.registerLazySingleton<LoginRepository>(
  //     () => LoginRepositoryImpl(apiService: GetIt.instance.get()));

  // use cases
  // GetIt.instance.registerSingleton(
  //    GetLoginUseCase(loginRepository: GetIt.instance.get()));
}

void getCharactersConfigure(){
  //dependencias necesarias para el módulo de personajes

  //Las dependencias se registran según la necesidad del módulo, es decir, respetando el orden en que se instanciaran
}
