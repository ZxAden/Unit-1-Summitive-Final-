//Unit 1 Summitive Final
float Menu1X=400, Menu1Y=400, RocketIconX=150, RocketIconY=400, PongIconX=650, PongIconY=400, FlappyBirdIconX=400, FlappyBirdIconY=600;
float rocketshipX=400, RockSpeed=0, rocketshipY=700, FireBallRockX[] = new float [12], FireBallRockY[]= new float [12];
float bombX=1000, bombY=5000, enemyRocketX=400, enemyRocketY=200, enemyX=2, ballSpeed=4, ballSpeedY=6;
float enemyBombX []=new float [5], enemyBombY []=new float [5], pongBallX=300, pongBallY=400;
float xPos = 300, yPos=400, xBackground = 0, point = 1, gravity = 0, ySpeed = 0, menu= 1, Pipex[] = new float[2], Pipey[] = new float[2]; //FlappyBird Floats
int score = 0, highScore, highScore1, RocketDamage=1, enemyShipLife=10;
PImage Background, Bird, Pipe, Pipe2;
boolean gameover=false,d = false, a = false;
boolean menu1=true, menu2=false, RocketGame=false, FlappyBird=false, PongGame=false, menu3=false, menu4=false, menu5=false, menu6=false, level1=false;
PImage Start, RocketIcon, FlappyBirdIcon, PongIcon, Start2, rocketship, SpaceBackground, FireBallRock, youDied, Rectangle, bomb, enemyBomb, rock2, EnemyRocket, winScreen;
int x = 50, y = 50, move_x = -25, move_y = -20, x2 = 750, y2 = 750, move_x2 = 25, move_y2 = 20, x3 = 0, y3=0;


void setup()
{
  size(800, 800);
  smooth (); 
  Start=loadImage("Start.png");
  Start.resize(200, 200);
  Start2=loadImage("Start2.png");
  Start2.resize(200, 200);
  RocketIcon=loadImage("RocketIcon.png");
  RocketIcon.resize(200, 200);
  FlappyBirdIcon=loadImage("FlappyBirdIcon.jpg");
  FlappyBirdIcon.resize(200, 200);
  PongIcon=loadImage("PongIcon.png");
  PongIcon.resize(200, 200);
  Background=loadImage("Background.png");
  Bird=loadImage("Bird.png");
  Pipe=loadImage("Pipe.png"); 
  Pipe2=loadImage("Pipe2.png");//LoadImages
  Background.resize(2000, 800);
  Bird.resize(60, 50);
  Pipe.resize(130, 600);
  Pipe2.resize(130, 600);
  rocketship=loadImage("rocketship.png");
  rocketship.resize(50, 75);
  SpaceBackground=loadImage("SpaceBackground.jpg");
  SpaceBackground.resize(800, 800);
  FireBallRock=loadImage("rock.png");
  FireBallRock.resize(100, 100);
  enemyBomb=loadImage("rock2.png");
  enemyBomb.resize(50, 50);
  youDied=loadImage("YouDied.jpg");
  youDied.resize(800, 800);
  Rectangle=loadImage("Paddle.jpg");
  Rectangle.resize(200, 100);
  bomb=loadImage("bomb.png");
  bomb.resize(20, 40);
  EnemyRocket=loadImage("EnemyRocket.png");
  EnemyRocket.resize(150, 150);
  winScreen=loadImage("winScreen.png");
  winScreen.resize(800, 800);
}
void draw()
{
  
  if (menu1==true) 
  {
    background(250, 5, 5);
    imageMode(CENTER);
    image(Start, Menu1X, Menu1Y);
  }


  if (menu1==true&&abs(mouseX -Menu1X)<100&&abs(mouseY - Menu1Y)<100&&mousePressed) 
  {
    menu1=false;
    menu2=true;
  }
  if (menu2==true) 
  {
    background(20, 255, 70);
    image(RocketIcon, RocketIconX, RocketIconY);
    image(PongIcon, PongIconX, PongIconY);
    image(FlappyBirdIcon, FlappyBirdIconX, FlappyBirdIconY);
    image(Start, 650, 650);
    image(Start2, 150, 650);
    fill(0, 0, 200); 
    textSize(50);
    text("Select Your Game", 200, 200);
  }
  if (menu2==true&&(abs(mouseX - 150)<100&&abs(mouseY - 400)<100 && mousePressed)) 
  {
    RocketGame=true;
    menu2=false;
  }
  if (menu2==true&&abs(mouseX - 400)<100&&abs(mouseY - 600)<100 && mousePressed) 
  {
    FlappyBird=true;
    menu2=false;
  }
  if (menu2==true&&abs(mouseX - 650)<100&&abs(mouseY - 400)<100 && mousePressed) 
  {
    PongGame=true;
    menu2=false;
  }

  if (FlappyBird==true) 
  {
    background(0);
    imageMode(CORNER);
    image(Background, xBackground, 0);//Background   
    if (menu==1) 
    {
      fill(5, 200, 5);
      rect(250, 300, 300, 100); 
      fill(5, 5, 200);
      textSize(50);
      text("Click to Play", 255, 370);
      score=0;
    }//Main Menu Screen
    if (FlappyBird==true&&menu==0) 
    {
      image(Bird, xPos, yPos);
      gravity+=0.6;
      yPos+=gravity;
      imageMode(CENTER); //Bird
      for (int i = 0; i<2; i++) 
      {
        image(Pipe2, Pipex[i], Pipey[i] - (Pipe2.height/2+120)); 
        Pipex[i]-=2.5;
      }
      imageMode(CENTER);
      for (int i = 0; i<2; i++) 
      {
        image(Pipe, Pipex[i], Pipey[i] + (Pipe.height/2+100)); 
        Pipex[i]-=2.5;//Loads Pipes
        if (Pipex[i]<150) 
        {
          Pipey[i]=(int)random(200, height-200);
          Pipex[i]=650;
        }
        if (yPos>height || yPos < 0 || (abs(xPos+60 - Pipex[i])<40 && abs(yPos+10 - Pipey[i])>110)) {
          gameover=true;
        }
        if (Pipex[i] == 300) 
        {
          score = score + 1 ; 
          highScore = max(score, highScore);
        }
      }
    }
    fill(30, 350, 30);
    rect(155, 10, 185, 50);
    rect(355, 10, 295, 50);
    fill(0);
    textSize(40);
    text("Score:"+score, 170, 50);//Score
    text("High Score:" +highScore, 360, 50);//Highscore
    if (gameover==true) 
    {
      menu=1;
      background(0);
      fill(5, 5, 200);
      fill(200, 5, 5);
      textSize(50);
      text("GAMEOVER", 260, 150);
      fill(200, 5, 50);
      rect(150, 500, 500, 500);
      fill(5, 200, 5);
      rect(150, 200, 500, 300);
      fill(5, 5, 200);
      textSize(50);
      text("Restart", 310, 370);
      fill(255);
      text("Quit", 340, 700);  
      fill(30, 200, 30);
      rect(155, 10, 185, 50);
      rect(350, 10, 295, 50);  
      fill(255);
      textSize(40);
      text("Score: "+score, 170, 50);
      text("High Score: " +highScore, 360, 50);
    }
  }
  /*
  So this space is to help me not get confused
  
  
  
  
  
  
  */
  if (RocketGame==true) 
  {
    background(0);
    imageMode(CENTER);
    image(SpaceBackground, 400, 400);

    if (RocketGame==true&&menu3==false) 
    {
      image(Rectangle, 400, 400);
      fill(0);
      textSize(30);
      text("Click To Play", 310, 410);
      textSize(40);
      fill(255);
      text("Score: "+score, 100, 50);
      text("High Score: " +highScore1, 400, 50);
    }
    if (RocketGame==true&&menu3==true) 
    {
      image(rocketship, rocketshipX, rocketshipY);
      if(a==true){rocketshipX-=10;}
      if(d==true){rocketshipX+=10;}
      fill(255);
      textSize(40);
      text("Score: "+score, 100, 50);
      text("High Score: " +highScore1, 400, 50);
      for (int i=0; i<12; i++) 
      {
        image(FireBallRock, FireBallRockX[i], FireBallRockY[i]);
        FireBallRockY[i]+=5;
        if (RocketGame==true&&menu3==true&&FireBallRockY[i]>height)
        {
          FireBallRockY[i]=0-random(400);
          FireBallRockX[i]=random(800);
          score=score+1;
          highScore1 = max(score, highScore1);
        }
        if (rocketshipX<0||rocketshipX>width||rocketshipY>height||abs(rocketshipX - FireBallRockX[i])<60&&abs(rocketshipY-FireBallRockY[i])<60)
        {
          menu4=true;
          RocketGame=false;
        }
        image(bomb, bombX, bombY);
        bombY-=4;
      }
      if (score>100) {
        level1=true;
      }
      if (score>100&&level1==true)
      {
        text("ENEMY WARCRAFT HP: " +enemyShipLife, 10, 100);
        for (int i=0; i<5; i++)
        {


          image(enemyBomb, enemyBombX[i], enemyBombY[i]);
          enemyBombY[i]+=6;
          if (score<101)
          {
            enemyBombX[i]=enemyRocketX;
            enemyBombY[i]=enemyRocketY;
          }
          if (3>1+random(1000))
          {
            enemyBombX[i]=rocketshipX+50-random(100);
            enemyBombY[i]=300+50-random(100);
            ;
          }

          if (abs(rocketshipX-enemyBombX[i])<50&&abs(rocketshipY-enemyBombY[i])<50) {
            RocketGame=false; 
            menu4=true;
          }
          if (abs(enemyRocketX-bombX)<75&&abs(enemyRocketY-bombY)<75)
          {
            bombY=0;
            enemyShipLife=enemyShipLife-1;
          }

          image(EnemyRocket, enemyRocketX, enemyRocketY);
          enemyRocketX+=enemyX;
          if (enemyRocketX>700) {
            enemyX=-3;
          }
          if (enemyRocketX<100) {
            enemyX=3;
          }
        }
      }
      if (enemyShipLife==0)
      {
        level1=false;
      }
      if (score>200)
      {
      }

      if (menu4==true)
      {
        image(youDied, 400, 400);
        image(Rectangle, 200, 600);
        image(Rectangle, 600, 600);
        fill(0);
        text("RESTART", 110, 620);
        text("QUIT", 550, 620);
        fill(255);
        textSize(40);
        text("Score: "+score, 100, 50);
        text("High Score: " +highScore1, 400, 50);
        a=false;
        d=false;
      }
      if (menu5==true)
      {
        background(0);
        image(winScreen, 400, 400);
        fill(0);
        rect(100, 600, 200, 100);
        fill(255);
        text("HighScore: " +highScore1, 15, 650);
        text("Continue", 50, 700);
      }
      if (PongGame==true) 
      {
        background(0);
        image(SpaceBackground, 400, 400);
        fill(0);
        ellipse(pongBallX, pongBallY, 50, 50);
        pongBallX+=ballSpeed;
        pongBallY+=ballSpeedY;
        if (pongBallX>width||pongBallY>height)
        {
          ballSpeed=-random(10);
          ballSpeedY=-random(10);
        }
        if (pongBallX<0||pongBallY<0)
        {
          ballSpeed=random(10);
          ballSpeedY=random(10);
          ;
        }
      }
    }
  }
}

void keyPressed() {
  if (FlappyBird==true&&key==' ') {
    gravity=-12;
  }
  if (RocketGame==true&&key=='d') {
    d=true;
  }
  if (RocketGame==true&&key=='a') {
    a=true;
  }
  if (RocketGame==true&&key==' ') 
  {
    bombY=rocketshipY;
    bombX=rocketshipX;
  }
}
void keyReleased()
{
    if (RocketGame==true&&key=='d') {
    d=false;
  }
    if (RocketGame==true&&key=='a') {
    a=false;;
  }
}
void mousePressed() {
  if (menu==1&&mousePressed&&FlappyBird==true) {
    Pipex[0]=750;
    Pipey[0]=300;
    Pipex[1]=1000;
    Pipey[1]=500;
    menu=0;
  }
  if (FlappyBird==true&&gameover==true&&abs(mouseX -300)<300&&abs(mouseY - 300)<200&&mousePressed) {
    gameover=false;
    yPos=400;
  }
  if (menu4==true&&abs(mouseX -110)<200&&abs(mouseY - 620)<100&&mousePressed) {
    background(0);
    menu4=false;
    RocketGame=true;
    menu3=true;
    FireBallRockY[0]=200; 
    FireBallRockY[1]=50; 
    FireBallRockY[2]=150; 
    FireBallRockY[3]=300; 
    FireBallRockY[4]=130; 
    FireBallRockY[5]=180; 
    FireBallRockY[6]=250; 
    FireBallRockY[7]=250;
    FireBallRockY[8]=220;
    FireBallRockY[9]=80;
    FireBallRockY[10]=80;
    FireBallRockY[11]=180;
    score=0;
    rocketshipX=400;
  }
  if (menu5==true&&mousePressed)
  {
    background(0);
    menu1=true;
    score=0;
    enemyShipLife=8;
    menu5=false;
    RocketGame=false;
  }
  if (menu4==true&&abs(mouseX -550)<200&&abs(mouseY - 620)<100&&mousePressed) {
    RocketGame=true;
    menu4=false;
    menu2=true;
  }
  if (FlappyBird==true&&gameover==true&&abs(mouseX -300)<300&&abs(mouseY - 600)<200&&mousePressed) {
    FlappyBird=false;
    menu1=true;
    menu=1;
  }
  if (FlappyBird==true&&mousePressed) {
    gravity=-12;
  }
  if (RocketGame==true&&abs(mouseX-400)<100&&abs(mouseY-400)<50&&mousePressed) {
    menu3=true;
  }
}
