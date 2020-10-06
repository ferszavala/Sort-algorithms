void setup()
{
  String texto = "xoxxooxxoxxxoxooxoxoxoxxo";
  String patron = "xoxoxxo";

  texto = texto.toLowerCase();
  patron = patron.toLowerCase();

  println("Texto:", texto);
  println("Patron:", patron);
  println("Busqueda kmp", busqueda_kmp(texto, patron));
}
ArrayList<Integer> busqueda_kmp(String texto, String patron)
{
  ArrayList<Integer> lista = new ArrayList<Integer>();
  int estado;
  int[] regreso = new int[patron.length()];

  //Paso 1. Patrón, calcular los regresos
  regreso[0] = -1;
  for (int i=1; i<patron.length(); i++)
  {
    estado = regreso[i-1]+1;
    while (patron.charAt(i) != patron.charAt(estado))
    {
      if (estado == 0)
      {
        estado = -1;
        break;
      }
      estado = regreso[estado-1]+1;
    }
    regreso[i] = estado;
  }
  /*for(int i=0;i<patron.length();i++)
   {
   println(i, patron.charAt(i),regreso[i]); 
   }*/

  //Paso 2. Buscar el patron dentro del texto
  estado = -1;
  for (int i=0; i<texto.length(); i++)
  {
    estado = estado+1;
    while (texto.charAt(i) != patron.charAt(estado) && estado>-1)
    {
      if (estado == 0)
      {
        estado = -1; 
        break;
      }
      estado = regreso[estado-1]+1;
    }
    if (estado == patron.length()-1)
    {
      lista.add(i-estado);
      estado = regreso[estado];
    }
  }
  return lista;
}
ArrayList<Integer> busqueda_secuencial(String texto, String patron)
{
  ArrayList<Integer> lista = new ArrayList<Integer>();
  int contador = 0;
  for (int i=0; i<texto.length(); i++)
  {
    contador = 0;
    for (int j=0; j<patron.length(); j++)
    {
      if (i+j<texto.length() && texto.charAt(i+j) == patron.charAt(j))
      {
        contador++;
      } else
      {
        break;
      }
    }
    if (contador == patron.length())
    {
      lista.add(i);
    }
  }
  return lista;
}
