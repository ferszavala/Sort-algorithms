void setup() {
  String s1 = "escuela";
  String s2 = "estudiante";

  s1 = s1.toLowerCase();
  s2 = s2.toLowerCase();

  println("Cadena 1:", s1);
  println("Cadena 2:", s2);
  println("Distancia Hamming", distancia_hamming(s1, s2));
  println("Busqueda secuencial", distancia_levenshtein(s1, s2));
}
int distancia_hamming(String s1, String s2) {
  int tamano_minimo = min(s1.length(), s2.length());
  //println("tamaño minimo es",tamano_minimo);
  int dist = 0;
  for (int i=0; i<tamano_minimo; i++) {
    if (s1.charAt(i) != s2.charAt(i) )
      dist++;
  }
  int diferencia_cadenas = abs(s1.length()-s2.length());
  dist = dist + diferencia_cadenas;
  return dist;
}

int distancia_levenshtein(String s1, String s2) 
{
  // Codificar
  int dist = 0;
  char[] arr1 = s1.toCharArray(); //convierta la cadena en un arreglo de caracteres
  char[] arr2 = s2.toCharArray(); //convierte la cadena en un arreglo de caracteres

  int tam1 = s1.length()+1; //se le suma 1 porque en la tabla la palabra empieza en el 1 y se agrega el 0
  int tam2 = s2.length()+1;

  int [][] mat = new int[tam1][tam2];
  for (int i=0; i<=s1.length(); i++)
  {
    mat[i][0]=i;
  }
  for (int j=0; j<=s2.length(); j++)
  {
    mat[0][j] = j;
  }
  
  for (int i=1; i<tam1; i++) //recorre 
  {
    for (int j=1; j<tam2; j++) //recorre
    {
      if (arr1[i-1] == arr2[j-1])
      {
        dist = 0; //cuando la letra si coincide en ambas palabras
      } else
      {
        dist = 1; //cuando no coincide
      }
      mat[i][j] = minimo(mat[i-1][j]+1, mat[i][j-1]+1, mat[i-1][j-1]+dist);
    }
  }
  return mat[s1.length()][s2.length()];
}

int minimo(int a, int b, int c)
{
  return min(a, min(b, c));
}
