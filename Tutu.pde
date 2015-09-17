// Aurélien Conil Summerlab 2014

Perso[] p = new Perso[2];   // personnage à gauche , personnage à droite
int nombrePerso = 15;        // nombre d'avatar en photos(fichiers+1)
boolean isMenu;
PImage[] trombinoscope = new PImage[nombrePerso];   //chargement des images de "profil" des avatars 
boolean choixNumero1;
boolean choixNumero2;
int demarrageDuJeu;
PImage m;

void setup() {
 size(1280, 800);
 isMenu = true;
 choixNumero1 = false;
 choixNumero2 =false;
 
  //Chargement du trombinoscope.
  for(int i=0;i<nombrePerso;i++)
  {
    
   m =loadImage("images/"+str(i)+"/14.JPG");      
   trombinoscope[i]=m;
    
   }
   
   //Création des personnages gauche et droit
 

 p[0] = new Perso(0, false);
 p[1] = new Perso(1, true);
 

 

}

//Fonction principale appelée à chaque fois
void draw() {
    
   
  
  if(isMenu){
  //Affichage du menu
  p[0].changeMode(0);
  p[1].changeMode(0);  
    
  afficheMenu();
  
  if(choixNumero1 && choixNumero2){
   // Les 2 joueurs ont choisis leur perso, le jeu peut commencer
    
   //persoValides();
      afficheMenu();
    isMenu = false; 

   demarrageDuJeu = millis();
   
   println("---------c'est parti"+millis());

   // On assure que les 2 joueurs commencent dans le mode 0, cad la position normale
   p[0].loadPerso(p[0].persoCourant);
   p[1].loadPerso(p[1].persoCourant);
println("---------personnages ok"+millis());
  }
  
  }
  else
  {
  // Execution standart du jeu 
  
  
  clear();
  background(0);
  

  // Petite ligne pour éviter certains bugs de claviers
//  if(keyPressed){ 
//   keyPressed(); 
//  }
  
  //Mise a jour des persos ( si ils avancent )
  for(int i=0;i<2;i++){
   
   p[i].update(); 
    
  }
  
  blendMode(LIGHTEST);
  // Dessin des personnages
  for(int i=0;i<2;i++){
   
   p[i].draw(); 
    
  }
  //Affichage d'un bandeau de texte au début du jeu pendant 3 secondes ( 3000 millisecondes )
  if( (millis() - demarrageDuJeu)< 8000 ){
  fill(255, 120, 130);
  text("Fanfaronnons !", width/2 - 150, height/2);
  
  } 

  }
  

  


}


 
 //Appui d'une touche du clavier
 void keyPressed() {
    
   
      for(int i=0;i<2;i++){ 
  
          switch(key){
           //--------------
            //Personnage 1
           //---------------
           //perso 1 gauche
           case 'q':
           if(isMenu){
            if(!choixNumero1){

              p[0].changePerso(false);
            }  
           }
           else{
             
             p[0].gauche();
           }
           break;
           //perso 1 droite
           case 'd':
           if(isMenu){
             if(!choixNumero1){
              p[0].changePerso(true);
             }  
           }
           else{
           p[0].droite();
           }
          break;
          //perso 1 haut
           case 'z':
           p[0].haut();
           break;
          // perso 1 bas
           case 's':
           p[0].bas();
           break;
          // perso 1 bouton1
           case 'w':
           if(isMenu){
            
            if(!choixNumero1){
              choixNumero1 = true;
            } 
             
             
           }
           else{
           p[0].bouton1();
           }
           break;
          // perso 1 bouton2
           case 'x':
           p[0].bouton2();
           break;
          // perso 1 bouton3
           case 'c':
           p[0].bouton3();
           break;
          // perso 1 bouton4
           case 'v':
           p[0].bouton4();
           break;
           //-----------------
           //personnage 2
           //-----------------
           //perso 2 gauche
           case 'j':
           if(isMenu){
            if(!choixNumero2){
              p[1].changePerso(false);
            }  
           }
           else{
             
           p[1].gauche();
           }
           break;
           //perso 2 droite
           case 'l':
           if(isMenu){
            if(!choixNumero2){
              p[1].changePerso(true);
            }  
           }
           else{
           p[1].droite();
           }
           break;
          //perso 2 haut
           case 'i':
           p[1].haut();
           break;
          // perso 2 bas
           case 'k':
           p[1].bas();
           break;
          // perso 2 bouton1
           case ',':
           if(isMenu){
             
             if(!choixNumero2){
              choixNumero2 = true; 
             }
             
           }else{
           p[1].bouton1();
           }
           break;
          // perso 2 bouton2
           case ';':
           p[1].bouton2();
           break;
          // perso 2 bouton3
           case 'g':
           p[1].bouton3();
           break;
          // perso 2 bouton4
           case 't':
           p[1].bouton4();
           break;
          //----------------------
          // Choix du personnage
          //----------------------
          case 'm':
          isMenu = true;
          choixNumero1 = false;
          choixNumero2 = false;
          break;
          
         }
     
     
     }
    
    
 }
 
 
//Relachement d'une touche du clavier
void keyReleased() 
 {
    
      for(int i=0;i<2;i++){ 
  
          switch(key){
           //--------------
            //Personnage 1
           //---------------
           //perso 1 gauche
           case 'q':
           p[0].arreterDeplacement();
           p[0].reset(false);
           
           break;
           //perso 1 droite
           case 'd':
           p[0].arreterDeplacement();
           p[0].reset(false);
           
          break;
          //perso 1 haut
           case 'z':
           p[0].reset(false);
           break;
          // perso 1 bas
           case 's':
           p[0].reset(false);
           break;
          // perso 1 bouton1
           case 'w':
           p[0].reset(true);
           break;
          // perso 1 bouton2
           case 'x':
           p[0].reset(true);
           break;
          // perso 1 bouton3
           case 'c':
           p[0].reset(true);
           break;
          // perso 1 bouton4
           case 'v':
           p[0].reset(true);
           break;
           //-----------------
           //personnage 2
           //-----------------
           //perso 2 gauche
           case 'j':
           p[1].arreterDeplacement();
           p[1].reset(false);
           
           break;
           //perso 2 droite
           case 'l':
           p[1].arreterDeplacement();
           p[1].reset(false);
           
           break;
          //perso 2 haut
           case 'i':
          p[1].reset(false); 
           break;
          // perso 2 bas
           case 'k':
           p[1].reset(false);
           break;
          // perso 2 bouton1
           case ',':
           p[1].reset(true);
           break;
          // perso 2 bouton2
           case ';':
           p[1].reset(true);
           break;
          // perso 2 bouton3
           case 'g':
           p[1].reset(true);
           break;
          // perso 2 bouton4
           case 't':
           p[1].reset(true);
           break;
  
          
         }

     
     
     }
    
    
 }
 
 boolean sketchFullScreen() {
  return true;
}
