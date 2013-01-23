import com.nootropic.processing.layers.*;
import java.util.Vector;
import SimpleOpenNI.*;

Vector growers;
int c1, c2;

PImage bgstars, bg, front, blink;

AppletLayers layers;


SimpleOpenNI  context;
boolean       autoCalib=true;
int kinectUserId;
PVector userHead = new PVector();
PVector userLeft = new PVector();
PVector userRight = new PVector();


void setup() {

  size(1280, 800);
  context = new SimpleOpenNI(this);
  context.setMirror(true);

  // enable depthMap generation 
  if (context.enableDepth() == false)
  {
    println("Can't open the depthMap, maybe the camera is not connected!"); 
    exit();
    return;
  }

  // enable skeleton generation for all joints
  context.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);



  layers = new AppletLayers(this);
  MyLayer m = new MyLayer(this);
  MyKinect k = new MyKinect(this);
  MyFireworks f = new MyFireworks(this);
  MyMagic c = new MyMagic(this);
  layers.addLayer(m);
  layers.addLayer(k);
 layers.addLayer(f);
  layers.addLayer(c);
  //--

  //--
  c1 = 0x8C8085;
  c2 = 0xE6E5E1;
  // gradientBackground(c1, c2);
  //background(0);
  growers = new Vector();
  smooth();
  colorMode(RGB);
  bgstars = loadImage("allstars.png");
  bg = loadImage("arriereplan.png");
  //blink = loadImage("blurstars-scintillantes.png");


  background(0);

  image(bgstars, 0, 0);
  image(bg, 0, 0);
  //frameRate(25);
}

void draw() {


  for (int i = 0; i < growers.size(); i++) {
    ((Grower)growers.get(i)).grow();
    ((Grower)growers.get(i)).display();
  }
}

// paint method for Processing 1.5 or higher:
void paint(java.awt.Graphics g) {
  // This method MUST be present in your sketch for layers to be rendered!
  if (layers != null) {
    layers.paint(this);
  } 
  else {
    super.paint(g);
  }
}

