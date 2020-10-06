import java.util.*;
void setup() 
{
  String texto = "ccaabcaabxaacaabcaabcaabcaabcabdaa";
  String patron = "caabcaabca"; 
  println(texto);
  println(patron);
  println(busqueda_bmh(texto, patron));
} 

ArrayList<Integer> busqueda_bmh(String texto, String patron) 
{
  ArrayList<Integer> lista = new ArrayList<Integer>();
  Map<String, Integer> map = new HashMap<String, Integer>(); //crea pares de tipos de datos determinados, en este caso cadena y entero
  for (int i=patron.length()-1; i>=1; i--) 
  {
    map.put(patron.charAt(patron.length()-1-i)+"", i); //inserta los valores de acuerdo al tipo de dato que pedimos
  }
  
  int cont = 0; 
  for (int i=0; i<texto.length(); ) //for mejorado
    //String x:arr
  {
    cont = 0; 
    for (int j=0; i+j<texto.length() && j<patron.length(); j++) //verifica que no se salga de la long del texto ni del patrón
    {
      if (texto.charAt(i+j)==patron.charAt(j)) //si la posicion del texto coincide con la letra en la misma posicion del patrón
      {
        cont++;
      } else {
        break;
      }
    }
    if (cont == patron.length()) //verifica que el tamaño del contador coincida con el del patron para mandar la posición a la lista 
    {
      lista.add(i);
    }
    if (i+patron.length()<=texto.length()) 
    {
      char cad = texto.charAt(i+patron.length()-1);        
      if (map.containsKey(cad+"")) 
      {
        i+=map.get(cad+"");
      } else {
        i+=patron.length();
      }
    } else return lista;
  }
  
  return lista;
}
