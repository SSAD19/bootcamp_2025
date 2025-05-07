import 'package:bootcampo_extrados_class/features/Character/config/character_get_it.dart';
import 'package:bootcampo_extrados_class/features/user_dio/config/config.dart';

void configureGetItApp() {
  getCharactersConfigure();
  GetUserConfig();
  // getLocationsConfigure();
  // getEpisodesConfigure();
  // Revisar el main, ya que se debe agregar el siguiente código para que funcione correctamente
  // home: FutureBuilder(future: GetIt.instance.allReady(),(...)
}
