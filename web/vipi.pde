PImage bird;
PImage land;
ArrayList<Droppack> PackList;
//ArrayList<Obstacle> ObstacleList;
ArrayList<Objectif> ObjectifList;
Bird B1;
boolean Obstaclegen;
boolean ObjectifCreated;
int WorldLength;
int WorldHeight;
int score;

void setup(){
  loop();
  frameRate(30);
  Obstaclegen = false;
  ObjectifCreated = false;
  PImage[] tab = new PImage[2];
  PackList = new ArrayList<Droppack>();
  //ObstacleList = new ArrayList<Obstacle>();
  ObjectifList = new ArrayList<Objectif>();
  tab[0] = loadImage("../data/vipi1.png");
  tab[0].resize(200,230);
  tab[1] = loadImage("../data/vipi2.png");
  tab[1].resize(200,230);
  B1 = new Bird(50, 50,3, tab);
  size(1550,860);
  //Load all sprites
  land = loadImage("../data/background.png");
  land.resize(6400, 540);
  score = 0;
  
}

void draw(){
  imageMode(CORNER);
  image(land, 0,0);
  imageMode(CENTER);
  B1.update();
  /*
  int x = frameCount % land.width;
  for (int i = -10*x ; i < width ; i += land.width) {
    copy(land, 0, 0, land.width, height, i, 0, land.width, height);
  }*/
  
  incrementScore();
  text("Score : " + str(score), 50, 20);
  
  //image(bird, birdx, birdy);
  image (B1.nextImage(),B1.x,B1.y);
  //generateObstacles();
  scroll();
  generateObjectif();

  
  for (int i = 0; i < ObjectifList.size(); i++) {
    Objectif temp = ObjectifList.get(i);
    image(temp.sprite, temp.x,temp.y);
  }
  
    for (int i = 0; i < PackList.size(); i++) {
    Droppack temp = PackList.get(i);
    image(temp.sprite, temp.x,temp.y);
  }
  /*
  if(ObstacleList.size() >= 4){
    Obstaclegen=false;
  }
  else{
    Obstaclegen=true;
  }
  
   for (int j = 0; j < ObstacleList.size(); j++) {
   //print(j);
   Obstacle tempo = ObstacleList.get(j);
   if(tempo.x <= 0){
      ObstacleList.remove(tempo); 
      j = j-1;
      print(str(j)+" "+str(ObstacleList.size())+"\n");
    }
    //print("y : "+str(tempo.y)+"\n");
    image(tempo.sprite,tempo.x,(int)tempo.y); 
  }*/

}

void keyPressed(){
      if(key == 'q' || key == 'Q'){
       B1.vx = -1;
     }
     if(key == 'd' || key == 'D'){
       B1.vx = 1;
     }
     if(key == 'z' || key == 'Z'){
       B1.vy = -1;
     }
     if(key == 's' || key == 'S'){
       B1.vy = 1;
     }
}

void keyReleased(){
      if(key == 'q' || key == 'Q'){
       B1.vx = 0;
     }
     if(key == 'd' || key == 'D'){
       B1.vx =0;
     }
     if(key == 'z' || key == 'Z'){
       B1.vy = 0;
     }
     if(key == 's' || key == 'S'){
       B1.vy = 0;
     }
     if(key == 'a' || key == 'A'){
      Droppack P = new Droppack(B1.x, B1.y+1);
      PackList.add(P);
     }
}

void incrementScore(){
  score++;
}
void scroll(){
  //generateObstacles();
  for (Droppack i : PackList) {
    i.droppackFall();
    //print ("x : "+str(i.x));
    //print ("y : "+str(i.y));
  }
  /*
  for (Obstacle i : ObstacleList) {
    i.moveLeft(3);
    
  }*/
    
  for (Objectif i : ObjectifList) {
    i.moveLeft(2);
    
  }

}
/*
void generateObstacles(){
  if((int((frameCount/frameRate)))%5 == 0){
      if(Obstaclegen == true){ //!Obstaclegen
        int x = 600;
        int y = int(random(0,600));
        Obstacle O = new Obstacle(x,y);
        ObstacleList.add(O);
        //Obstaclegen = true;
      }
      
    //print(str(movespeed)+"\n");
    }
}*/

void generateObjectif(){
  //print("frame : "+str(frameCount)+" FrameRate : "+str(frameRate)+" calcul : "+str(int(frameCount/frameRate))+" test : "+str(int(frameCount/frameRate)%5)+"\n"); //print de debug de l'infini !!!!!!
  int margin = int(random(-10,10));
  if(frameCount%120 + margin == 0){
    if(!ObjectifCreated){
      print("objet cree : "+ str(int((frameCount/frameRate))%4) + "secondes"); 
      int x = 960;
      int y = 540 - 115;
      Objectif obj = new Objectif(x,y);
      ObjectifList.add(obj);
      ObjectifCreated = true;
    }
  }
  else{
    ObjectifCreated = false;
  }
}
  
class Bird{
  boolean increaseMovespeed;
  int x;
  int y;
  int vx, vy, movespeed;
  PImage[] birdimage;
  int indexAnim;
  
  Bird(int X, int Y,int Movespeed, PImage[] Birdimage){
    increaseMovespeed = false;
    x = X;
    y = Y;
    vx = 0;
    vy = 0;
    movespeed = Movespeed;
    birdimage = Birdimage;
    indexAnim = 0;
  }
  
  void update(){
    //print("frame : "+str(frameCount)+" FrameRate : "+str(frameRate)+" calcul : "+str(int(frameCount/frameRate))+" test : "+str(int(frameCount/frameRate)%5)+"\n"); //print de debug de l'infini !!!!!!
    if((int((frameCount/frameRate)))%5 == 0){
      if(!increaseMovespeed){
        movespeed++;
        increaseMovespeed = true;
      }
      
    print(str(movespeed)+"\n");
    }
    else{
      increaseMovespeed = false;
    }
    x+=vx*movespeed;
    y+=vy*movespeed;
  }
  
  PImage nextImage(){
    if(frameCount%6 == 0){
    indexAnim++;
    }
    if (indexAnim>=birdimage.length){
      indexAnim = 0;
    }
    return birdimage[indexAnim];
  }
  
  void dropPackage(){
    //spawn a package with the x coordinate of vp and y-1 of vp
  }
}

class Droppack {
    PImage sprite;
    int spriteHeight ;
    int spriteWidth ;
    int gravityFactor; //valeur arbitraire liée à la gravité
    int kineticFactor ; //selon le principe d'inertie de Newton, l'objet largué subira un mouvement vers l'avant qui sera atténué par les frottements de l'air
    int x ;
    int y ;
  Droppack(int X, int Y) {
    sprite = loadImage("../data/caisse.png");
    sprite.resize(50,50);
    gravityFactor = 3; //valeur arbitraire liée à la gravité
    kineticFactor = 1; //selon le principe d'inertie de Newton, l'objet largué subira un mouvement vers l'avant qui sera atténué par les frottements de l'air
    x = X;
    y = Y;
  }

  double droppackHitbox(){
    int area = spriteHeight*spriteWidth;
    return area;
  }

  void droppackFall(){
    x = (x + kineticFactor);
    y = (y + gravityFactor);
  }

}
/*
class Obstacle {
    PImage sprite;
    int spriteHeight;
    int spriteWidth;
    int x;
    int y;
    Obstacle(int X, int Y) {
    sprite = loadImage("../data/brickWall.jpg");
    //sprite.resize(50,50);

    x = X;
    y = Y;
  }


  void moveUp(int yMove){
    y = (y - yMove);
  }

  void moveDown(int yMove){
    y = (y + yMove);
  }

  void moveLeft(int xMove){
    x = (x - xMove);
  }

  void moveRight(int xMove){
    x = (x + xMove);
  }
}
*/
class Objectif {
    PImage sprite;
    int spriteHeight;
    int spriteWidth;
    int x;
    int y;
    Objectif(int X, int Y) {
    sprite = loadImage("../data/bonhomme.png");
    sprite.resize(150,230);
    x = X;
    y = Y;
  }


  void moveUp(int yMove){
    y = (y - yMove);
  }

  void moveDown(int yMove){
    y = (y + yMove);
  }

  void moveLeft(int xMove){
    x = (x - xMove);
  }

  void moveRight(int xMove){
    x = (x + xMove);
  }
}
