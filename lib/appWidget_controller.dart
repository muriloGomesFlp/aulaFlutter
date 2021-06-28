import 'package:flutter/widgets.dart';

/*ChangeNotifer: server para modificar um estado no backend, dirente do
setState que altera também o frontend.#aula 12 - gerencia de estado. 
*/
class AppController extends ChangeNotifier {
  /* Para que seja utilizado este controller (esta classe), é necessário usar do
  design patternes "singleton" que garente que a classe seja instanciada apenas
  uma vez. Deste modo, será instanciado aqui com o static (como a baixo) e chamado 
  nos outros dois locais de uso (AppWidget e home_page_aula_12).
  */
  static AppController instance = AppController();

  bool switchforDarfk = false;
  mudarTema() {
    /*O uso do ! faz a alteração de F/V ou V/F conforme entrada da variável;
    */
    switchforDarfk = !switchforDarfk;
    /*o notifyListeners, fica "ouvindo" quando o metodo for chamado. Neste caso
    quando o switch mudar seu valor este metodo altera automaticamete.
    */
    notifyListeners();
  }
}
/*******************************Fim Aula 12*************************** */
