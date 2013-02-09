import java.util.Vector;
import SimpleOpenNI.*;

Vector growers;

PImage bgstars, bg, front, blink, back;


SimpleOpenNI  context;
boolean       autoCalib=true;
int kinectUserId;
PVector userHead = new PVector();
PVector userLeft = new PVector();
PVector userRight = new PVector();

String mode;
boolean fade=false;
boolean fadein=true;
int aIn=0;
int numBubbles = 300;
ArrayList balls;

void setup() {

  size(1280, 800);
  context = new SimpleOpenNI(this);
  context.setMirror(true);
  
  balls = new ArrayList();

  // enable depthMap generation 
  if (context.enableDepth() == false)
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // enable skeleton generation for all joints
  context.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);

  //background(0);
  growers = new Vector();
  smooth();
  colorMode(RGB);
  bgstars = loadImage("allstars.png");
  bg = loadImage("arriereplan.png");
  //blink = loadImage("blurstars-scintillantes.png");
  front=loadImage("premierplan.png");

  background(0);

  image(bgstars, 0, 0);
  image(bg, 0, 0);
  back=get();
  frameRate(120);
  particles = new ArrayList<Particle>();
}

void draw() {

  if (mode=="debut") {
      
    animDebut();
  
  }else if (mode=="efface") {
      animEfface();
  }else {

    background(back);

    for (int i = 0; i < growers.size(); i++) {
      ((Grower)growers.get(i)).grow();
      ((Grower)growers.get(i)).display();
    }

    back=get();


    kinectDisplay();
    fireworksDisplay();


    image(front, 0, 0);
    if (debug) {
      text("fps : "+frameRate+ "Generation de "+growers.size()+ " plantes", 20, 20);
    }
  }
}

