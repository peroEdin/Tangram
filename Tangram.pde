int level, state = 0, gotovo, has, i;
int px[], py[], r[];
color c[];
double time, time2, time3;
//XML TangramXML;
final int all = 8;
//XML[] shapes, levels, vertices;
//final int stateWel=0;
//final int stateGam=1;
//final int stateSuc=2;
int x,y;

void setup(){
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
  noStroke();
  px = new int[7];
  py = new int[7];
  r = new int[7];
  c = new color[7];
  //TangramXML = loadXML("tangram.xml");
  //shapes = TangramXML.getChildren("shape");
  //levels = TangramXML.getChildren("level");
  level = 1;
  gotovo = 0;
  state = 0;
  resetShapes(all);
}
void draw(){
  loadPixels();
  background(0);
  switch(state){
    case 0:{
      loadMenu();
      break;
    }
    case 1:{
      if (gotovo==0) {
        timer();
        loadLevel(level);
        loadShapes();
        drawFrame();
      } else if (gotovo==1) loadLevel(0);
      break;
    }
  }
}
void mousePressed(){
    color mouseC = get(mouseX,mouseY);
    pickShape(mouseC);
    x=mouseX;
    y=mouseY;
}

void mouseReleased(){
  if (state==0){
    levelFinder();
  }
  else{
    if( gotovo == 1 ) {
      gotovo=0;
      state=0;
      loadShapes();
      resetShapes(all);
    }
    if ( abs(x-mouseX)<5 && abs(y-mouseY)<5 ){
      if(has < 7 && has >= 0)
        r[has] = (r[has] + 1) % 8;
    }
    if(has != -1){
      if(px[has] < 0 || px[has] > width || py[has] < 0 || py[has] > height ){
        resetShapes(has);
      }
    }
    if (levelFinished()) { 
      gotovo=1;
      level++;  
      time3=(millis()-time2)/1000;
    }  // ako je količina bijele boje dovoljno mala prelazimo na iducu razinu
  }
}
void keyReleased(){
  if( key == ' '){
    resetShapes(all);
  }
  if( key == 'm' || key == 'M'){
    state = 0;
    resetShapes(all);
  }
}
void loadLevel(int l){switch(l){
    case 0: {
      background(0);
      fill(255); 
      textAlign(CENTER);
      textSize(100);
      stroke(15);
      text("Prosli ste level " + str(level-1) ,width/2, height/2);
      textSize(50);
      text("Potrebno vrijeme: " + time3, width/2,height/2+100);
      break;
    }
    case 1: {    // kvadrat
      fill(255);
      beginShape();
      vertex(10,330);
      vertex(330,650);
      vertex(650,330);
      vertex(330,10);
      endShape();
      break;
    }
    case 2: {  // trokut
      fill(255);
      beginShape(TRIANGLES);
      vertex(0,0);
      vertex(641,0);
      vertex(0,641);
      endShape();
      break;
    }
    case 3: {
      fill(255);  // pješčani sat
      beginShape();
      vertex(10,10);
      vertex(687,10);
      vertex(463,237);
      vertex(687,463);
      vertex(10,463);
      vertex(237,237);
      endShape();
      break;
    }
    case 4: {  // pravokutnik
      fill(255);
      beginShape();
      vertex(10,10);
      vertex(650,10);
      vertex(650,330);
      vertex(10,330);
      endShape();
      break;
    } 
    case 5: { // četverokut
      fill(255);
      beginShape();
      vertex(10,10);
      vertex(810,10);
      vertex(490,330);
      vertex(10,330);
      endShape();
      break;
    }
    case 6: { // šesterokut
      fill(255);
      beginShape();
      vertex(170,10);
      vertex(490, 10);
      vertex(490,330);
      vertex(330,490);
      vertex(10,490);
      vertex(10,170);
      endShape();
      break;
    }
    case 7: {  //paralelogram
      fill(255); 
      beginShape();
      vertex(330,10);
      vertex(970,10);
      vertex(650,330);
      vertex(10,330);
      endShape();
      break;
    }
    case 8: {  
      fill(255);  // slovo D
      beginShape();
      vertex(0,0);
      vertex(320,0);
      vertex(160,160);
      vertex(160,480);
      vertex(320,640);
      vertex(320,0);
      vertex(480,160);
      vertex(480,480);
      vertex(320,640);
      vertex(0,640);
      endShape();
      break;
    }
    case 9: {
      fill(255);  // slovo A
      beginShape();
      vertex(160,0);
      vertex(320,0);
      vertex(480,160);
      vertex(320,160);
      vertex(160,160);
      vertex(160,320);
      vertex(320,320);
      vertex(320,160);
      vertex(480,160);  
      vertex(480,640);
      vertex(320,480);
      vertex(160,480);
      vertex(0,640);
      vertex(0,160);
      endShape();
      break;
    }
    case 10: {
      fill(255);  // slovo M
      beginShape();
      vertex(0,0);
      vertex(320,320);
      vertex(640,0);
      vertex(640,640);
      vertex(480,480);
      vertex(480,320);
      vertex(320,480);
      vertex(160,320);
      vertex(160,480);
      vertex(0,640);
      endShape();
      break;
    }
    case 11: {
      fill(255);  // slovo C
      beginShape();
      vertex(0,0);
      vertex(480,0);
      vertex(480,160);
      vertex(160,160);
      vertex(160,480);
      vertex(480,480);
      vertex(480,640);
      vertex(0,640);
      endShape();
      break;
    }
    case 12: {  //slovo T
      fill(255);
      beginShape();
      vertex(0,0);
      vertex(641,0);
      vertex(641,320);
      vertex(480,160);
      vertex(400,160);
      vertex(400,640);
      vertex(240,640);
      vertex(240,160);
      vertex(160,160);
      vertex(0,320);
      endShape();
      break;
    }
    case 13: {
      fill(255);  // patka
      beginShape();
      vertex(640,10);
      vertex(800,170);
      vertex(640,170);
      vertex(800,330);
      vertex(800,490);
      vertex(690,600);
      vertex(240,600);
      vertex(15,376);  
      vertex(690,376);
      vertex(480,170);
      endShape();
      break;
    }
    case 14: { // ribica 1
      fill(255);
      beginShape(TRIANGLES);
      vertex(420,0); //A
      vertex(100,320); //B
      vertex(420,640); //C
      endShape();  
      beginShape();
      vertex(420, 113);//D
      vertex(533, 0);//E
      vertex(533, 226);//F
      vertex(580, 273);//G 
      vertex(580, 433);//H
      vertex(533, 480);//
      vertex(533, 706);//I
      vertex(420, 593);//J
      endShape(CLOSE);  
      beginShape();
      vertex(580,353);
      vertex(693,240);
      vertex(806,353);
      vertex(693,466);
      endShape(CLOSE);
      break;
    }
    case 15: { // pas
      fill(255);
      rect(220, 294, 546, 226);
      beginShape(TRIANGLES);
      vertex(220,520); //A
      vertex(220,200); //B
      vertex(540,520); //C
      vertex(220,460); //A malo gore
      vertex(220,686); //D
      vertex(107,573); //E
      vertex(766,294); //E
      vertex(879,407); //E+
      vertex(879,181); //E- 
      vertex(879,407); //E+
      vertex(879,181); //E-
      vertex(992,294); //E
      vertex(879,181); //E-
      vertex(653,181); //E-
      vertex(766,68); //E-
      /*
      vertex(540,520); //C
      vertex(766,294); //E
      vertex(314,294); //F*/
      endShape(); 
      beginShape(QUADS);
      vertex(606,520); //D
      vertex(832,520); //D
      vertex(945,633); //D
      vertex(719,633); //D
      endShape(); 
      break;
    }
    case 16:{ // ribica 2
      beginShape();
      vertex(180, 110);
      vertex(340, 270);
      vertex(500, 110);
      vertex(500, 30);
      vertex(820, 350);
      vertex(500, 670);
      vertex(500, 590);
      vertex(340, 430);
      vertex(180, 590);
      endShape(CLOSE);
      break;
    }
  }
}
void loadShapes(){  for(i=0;i<7;i++){
    pushMatrix();
    translate(px[i],py[i]);
    rotate(r[i]*radians(45));
    fill(c[i]);
    scale(1);
    switch(i){
    case 0: // Big ones.
    case 1: 
      beginShape(TRIANGLES);
      vertex(-240,-80);
      vertex(80,-80);
      vertex(80,240);
      endShape();
      break;
    case 2: // Medium
      beginShape(TRIANGLES);
      vertex(-80,0);
      vertex(80,160);
      vertex(80,-160);
      endShape();
      break;
    case 3: // Diamond
      beginShape(QUADS);
      vertex(-80,0);
      vertex(-80,-160);
      vertex(80,0);
      vertex(80,160);     
      endShape();
      break;
    case 4: // Square
      rect(-80,-80,160,160);
      break;
    case 5: // Small ones.
    case 6: 
      beginShape(TRIANGLES);
      vertex(-120,-40);
      vertex(40,-40);
      vertex(40,120);
      endShape();
      break;
    }   
    popMatrix();
  }
  if( mousePressed && (has != -1) ){
    px[has] += mouseX-pmouseX;
    py[has] += mouseY-pmouseY;
  }
}
void pickShape(color mColor){
  for(int j=0;j<7;j++){
    if( c[j] == mColor ){
      has = j;
    }
  }  
}
boolean levelFinished(){
  int[] hist = new int[256];
  // Calculate the histogram
    for (int i = 0; i < 1080; i++) {
      for (int j = 0; j < 720; j++) {
        int bright = int(brightness(get(i, j)));
        hist[bright]++; 
      }
    }
    if (hist[255]<5000)
      return true;
    else return false;
}
void resetShapes(int who){
  if(who < 7 && who >= 0){
    px[who]=int(random(250,750));
    py[who]=int(random(250,550));
    r[who]=int(random(0,8));
    c[who]=color( random(50,200),random(50,200),random(50,200)); //color((255.0/8.0)*(1+i),128,128);
  }
  else{
    for(i=0;i<7;i++){
      px[i]=int(random(250,750));
      py[i]=int(random(250,550));
      r[i]=int(random(0,8));
      c[i]=color( random(50,200),random(50,200),random(50,200)); //color((255.0/8.0)*(1+i),128,128);
    }
    has = -1;
  }
}
void drawFrame(){
  noStroke();
  fill(0);
  rect(0,0,width,4);
  rect(0,0,4,height);
  rect(width-4,0,4,height);
  rect(0,height-4,width,4);
}
void loadMenu(){
      fill(255);
      textSize(30);
      textAlign(LEFT);
      text("odaberite level: " , 30 , 30 );
      stroke(220);
      line (40 , 80 , 960, 80);
      line (40 , 235 , 960, 235);
      line (40, 380 , 960, 380);
      line (40 , 535 , 960 , 535);
      line (40 , 680 , 960, 680);
      line (40, 80 , 40, 680);
      line (960,80 , 960, 680);
      line (270,80, 270,680);
      line (500,80,500,680);
      line (730,80,730,680);
      textAlign(CENTER);
      textSize(100);
      text("1", 155, 205);
      text("5",155, 350);
      text("9",155,505);
      text("13", 155, 650);
      text("2", 385, 205);
      text("6",385, 350);
      text("10",385,505);
      text("14",385, 650);
      text("3", 615, 205);
      text("7",615, 350);
      text("11",615,505);
      text("15", 615, 650);
      text("4", 845, 205);
      text("8",845, 350);
      text("12",845,505);
      text("16", 845, 650);
}
void showScore(){
      background(0);
      fill(255); 
      textAlign(CENTER);
      textSize(100);
      stroke(15);
      text("Prosli ste level " + str(level-1) ,width/2, height/2);
      textSize(50);
      text("Potrebno vrijeme: " + time3, width/2,height/2+100);
}
void timer(){
        fill(255);
        textSize(30);
        textAlign(LEFT);
        text("Level: " + level + " Vrijeme: "+ ((millis()-time2)/1000) , 500 , 690 );
}
void levelFinder(){  
    if (mouseX > 40 && mouseX <270){
      if (mouseY >80 && mouseY < 235){state=1;level=1;time2=millis();}
      if (mouseY >235 && mouseY < 380){state=1;level=5;time2=millis();}
      if (mouseY >380 && mouseY < 535){state=1;level=9;time2=millis();}
      if (mouseY >535 && mouseY < 680){state=1;level=13;time2=millis();}
    }
    else if (mouseX > 270 && mouseX <500){
      if (mouseY >80 && mouseY < 235){state=1;level=2;time2=millis();}
      if (mouseY >235 && mouseY < 380){state=1;level=6;time2=millis();}
      if (mouseY >380 && mouseY < 535){state=1;level=10;time2=millis();}
      if (mouseY >535 && mouseY < 680){state=1;level=14;time2=millis();}
    }
    else if (mouseX > 500 && mouseX <730){
      if (mouseY >80 && mouseY < 235){state=1;level=3;time2=millis();}
      if (mouseY >235 && mouseY < 380){state=1;level=7;time2=millis();}
      if (mouseY >380 && mouseY < 535){state=1;level=11;time2=millis();}
      if (mouseY >535 && mouseY < 680){state=1;level=15;time2=millis();}
    }
    else if (mouseX > 730 && mouseX <960){
      if (mouseY >80 && mouseY < 235){state=1;level=4;time2=millis();}
      if (mouseY >235 && mouseY < 380){state=1;level=8;time2=millis();}
      if (mouseY >380 && mouseY < 535){state=1;level=12;time2=millis();}
      if (mouseY >535 && mouseY < 680){state=1;level=16;time2=millis();}
    }
}