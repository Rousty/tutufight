// by Aurélien Conil  Summerlab 2014


class Perso{
  
  
  PImage[] img = new PImage[28];
  boolean isRight;
  int posx=300;
  int posy=-150;
  int mode = 0;
  int limiteGauche;
  int limiteDroite;
  int persoCourant; //numéro de l'avatar pour choisir les photos associées
  int imageCourante;
  int deplacement;
  float lastChange; // permet d'éviter les problèmes d'un double chargement de personnage. On impose un delay entre 2 personnages
  
  // Fonction appelée à la création du personnage
  Perso(int num, boolean isright){
    
    
    loadPerso(num);
    imageCourante = 0;
    isRight = isright;
    lastChange=millis();
    
    init(); 
    
  }
 
 // Fixe la position initiale des personnage
 void init(){   
   
    mode=0; 
   
   if(isRight){
     
     posx = (width/4)*3;
     limiteGauche = width/2;
     limiteDroite = width; 
      
    }
    else{
     
     posx = (width/4); 
     limiteGauche = 0;
     limiteDroite = width/2;
     
    }
    
    
  }
  
  //Fonction update appelé pour l'update du perso, et gere essentiellement le déplacement
  void update(){

    if(deplacement == 1 ){
     
     allerADroite(); 
      
    }
    if(deplacement == 2){
     
     allerAGauche(); 
      
    }
    
  }

  //Affichage du personnage
  void draw(){
    
    if(isMenu){
    // On affiche depuis le trombinoscope 
    
    m = trombinoscope[persoCourant];
    
    int finalposx = posx - m.width/2;
    int finalposy = posy ;

    image(m, finalposx, finalposy);
      
    }
    else{
    // dans le jeu normal, on affiche depuis le tableau img
      
    m = img[imageCourante];
    
    int finalposx = posx - m.width/2;
    int finalposy = posy ;

    image(m, finalposx, finalposy);

    }
    
  }
  
  //Changement de personnage avec les fleches gauche et droite
  void changePerso(boolean changeup){
    
    if(  (millis() - lastChange )>100){
    //Permet d'eviter les erreurs de répétitions
      
        if(changeup && (persoCourant< (nombrePerso - 1))){
    
        loadPerso(persoCourant + 1);
        
        println("perso up");
        println(persoCourant + 1);
        
         lastChange= millis();
        
        }
        
        if(!changeup && (persoCourant>0)){
         
         loadPerso(persoCourant -1); 
         println("perso down");
        println(persoCourant + 1);
        
        lastChange= millis();
          
        }
        
    }
    
    
    
  }
  
  //Chargement d'un nouveau personnage ( un peu long car il faut charger toutes les images )
  void loadPerso(int p){
    
      persoCourant = p;
      
      if(!isMenu){
    
      for(int i=0;i<28;i++)
      {
    
      m =loadImage("images/"+str(p)+"/"+str(i+1)+".JPG");      
      img[i]=m;
    
      }
      
      
      }
    
  }
  
  // Le personnage est considéré en déplacement tant que la touche n'a pas été relachée
  void commencerDeplacement(boolean toTheRight){
   
   if(toTheRight)
   deplacement = 1; // la valeur 1 correspond au déplacement vers la droite
  else
   deplacement = 2;  // la valeur 2 ... vers la gauche
    
  }
  
  void arreterDeplacement(){
   
   deplacement = 0; // La valeur 0 est la position stop
    
  }
  
  void allerAGauche(){
    
      if( posx > limiteGauche){
      posx = posx - 3; 
      
      // Alternance de la photo de deplacement, selon si la position est pair ou impair
      if(posx%4==0){
       imageCourante = 2 ;
      }
      else
        imageCourante = 2;
      
      }
  }
  void allerADroite(){
    
      if(posx < limiteDroite ){
        posx = posx + 3;
      // Alternance de la photo de deplacement, selon si la position est pair ou impair
      if((posx/5)%2==0){
       imageCourante = 4 ;
      }
      else
        imageCourante = 4;
      }
    
  }
  
  void gauche(){
    
   switch(mode){
     
     case 0 :
     commencerDeplacement(false);
      break;
     case 1 :
     imageCourante = 9;
     break;
     case 2:
     imageCourante = 14;
     break;
     case 3:
     imageCourante = 19;
     break;
     case 4:
     imageCourante = 24;
     break;
     
   }
    
  }
  
  void droite(){
    
       switch(mode){
     
     case 0 :
     commencerDeplacement(true);
      break;
     case 1 :
     imageCourante = 10;
     break;
     case 2:
     imageCourante = 15;
     break;
     case 3:
     imageCourante = 20;
     break;
     case 4:
     imageCourante = 25;
     break;
     
    
   }
    

    
  }
  
  void haut(){
    
     switch(mode){
     
     case 0 :
     imageCourante = 6;
      break;
     case 1 :
     imageCourante = 11;
     break;
     case 2:
     imageCourante = 16;
     break;
     case 3:
     imageCourante = 21;
     break;
     case 4:
     imageCourante = 26;
     break;
    
    
  }
  
  }
  
  void bas(){
    
    switch(mode){
     
     case 0 :
     imageCourante = 7;
      break;
     case 1 :
     imageCourante = 12;
     break;
     case 2:
     imageCourante = 17; 
     break;
     case 3:
     imageCourante = 22;  
     break;
     case 4:
     imageCourante = 27;   
     break;
      
  }
  
  }
  
  void bouton1(){
    
    changeMode(1);
      
  }
  
  void bouton2(){
   
    changeMode(2);
    
  }
  
  void bouton3(){
    
     changeMode(3);
  }
  
  void bouton4(){

     changeMode(4);
    
  }
  
  void reset(boolean resetTotal){
    
    if(resetTotal){
    changeMode(0);
    }
    else{  
    changeMode(mode);
     }

    
  }
  
 void changeMode(int m){
    
   // Changement de mode
   // Mode 0 : c'est la position de base
   // Mode 1 : appui du bouton1
   // Mode 3 : appuis du bouton ...2
   // etc ...
    
    mode = m; 
   
   
   switch(mode){
     
     case 0:
     if(isRight){
       imageCourante = 0;
     }
     else{
       imageCourante = 1;
     }
     break;
     case 1:
     imageCourante = 8;
     break;
     case 2:
     imageCourante = 13;
     break;
     case 3:
     imageCourante = 18;
     break;
     case 4:
     imageCourante = 23;
     break;
     
     
    }
    
 }
  
  
}
  

  


