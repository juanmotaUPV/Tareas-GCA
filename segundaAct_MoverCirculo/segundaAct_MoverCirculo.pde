import java.util.List;
Circulo tmp;
List <Circulo>lista; // <> Operador Diamante
String q="";
float x,y;
int n=-1; // para el id del circulo
int k = 70; // numero de circulos en la lista
void setup(){
    size(400,300);
    lista = new <Circulo>ArrayList();
    tmp = null;
    for(int i=0; i <k ;i++){
       x = random(width);
       y = random(height);
       tmp = new Circulo(x,y,50,i);
       lista.add(tmp);
    }
}

void draw(){
   background(0);
   for(int i=0; i < lista.size() ;i++){
       tmp = lista.get(i);
       tmp.dibuja();
   }
   textSize(24);
   fill(#DB145D);
   text(q,40,50);
   fill(255);
}

void mousePressed(){
  q="";
   for(int i=lista.size()-1; i>=0  ;i--){
          tmp = lista.get(i);
          if (tmp.isAdentro(mouseX, mouseY) ) {
             n = tmp.id;
             q += tmp.id;
             tmp.mover=true;
             break;
          }
   }
   
}

void mouseReleased(){
   q = "";
   n = -1; // no se está seleccionando nigún círculo.
   tmp.mover = false;
   tmp = null;
}

void mouseDragged(){
   if(n!=-1){
     tmp = lista.get(n);
     tmp.mover=true;
     tmp.x = mouseX;
     tmp.y = mouseY;
   }
}
