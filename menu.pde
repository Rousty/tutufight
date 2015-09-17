
// by Aurélien Conil  Summerlab 2014

void afficheMenu(){
  
 clear();
 background(0);
  
  p[0].init();
  p[1].init();
  
  p[0].draw();
  p[1].draw();
  

  
  //Dessin d'un rectangle rouge ou vert autour du personnage pour le choix du joueur
  
  //definition de la taille du rectangle
  int rectangleW = 380;
  int rectangleH = 650;
  int offsetx = 120;
  int offsety = 150;
  
  //dessin du rectangle gauche, joueur 1
  noFill();
  beginShape();
  strokeWeight(10);
  if(!choixNumero1)
  stroke(255, 0, 0);
  else
  stroke(0, 255, 0);
  vertex(offsetx, offsety);
  vertex(offsetx + rectangleW, offsety);
  vertex(offsetx + rectangleW, offsety + rectangleH);
  vertex(offsetx, offsety + rectangleH);
  endShape(CLOSE);
  
  //dessin du rectangle droit, joueur 2
 
  beginShape();
  strokeWeight(10);
  if(!choixNumero2)
  stroke(255, 0, 0);
  else
  stroke(0, 255, 0);
  vertex(width -offsetx, offsety);
  vertex(width - offsetx - rectangleW, offsety);
  vertex(width - offsetx - rectangleW, offsety + rectangleH);
  vertex(width -offsetx, offsety + rectangleH);
  endShape(CLOSE);
  
  
  //Affichage du titre
  fill(255, 255, 255);

  // Affichage du personnage numéro 1
  if(!choixNumero1){
  //textSize(32);
  //text("choisis ton perso ( <--  --> )", 10, height - 50);
  //text("Bouton Jaune pour valider", 10, height - 20);
  
  }
  else{
  textSize(32);
  text(" Jouez ! ", width/4 - 80, 230); 
    
  }
  
  
  if(!choixNumero2){
   //textSize(32);
  //text("choisis ton perso ( <--  --> )", 10, height - 50);
  //text("Bouton Jaune pour valider", 10, height - 20);
  
  
  }
  else{
  textSize(32);
  text(" Jouez ! ", (width/4)*3 - 80, 230); 
    
  }
  
   PImage logo =loadImage("images/fanfarons.gif"); 
   image(logo, 140, 0); 
  
  
}
