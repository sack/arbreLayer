//SimpleOpenNI  context;
class MyKinect extends Layer {
  
  ArrayList<Particle> particles;
color fin;
float amt = 0.0;
color partColor;
  
  

  MyKinect(PApplet parent) {
    super(parent); // This is necessary!


    //--
  }


  void setup() {
     //size(1280,800);
    //kinect
    //context = new SimpleOpenNI(this);
    // disable mirror
  //particules 
  particles = new ArrayList<Particle>();
  
    
    
  }
  void draw() {  
context.update();
if (context.isTrackingSkeleton(kinectUserId)) {
      getUserCoords(kinectUserId);
}
    background(0, 0); // clear the background every time, but be transparent
    // now draw something
     fill (253, 251, 1, random(20, 255));
    //ellipse(userHead.x, userHead.y, 8, 8);
     fill (253, 251, 1, random(20, 255));
     ellipse(userLeft.x, userLeft.y, 5, 5);
     ellipse(userRight.x, userRight.y, 5, 5);
//ellipse(mouseX+50, mouseY+50, 20, 20);

  particles.add(new Particle(new PVector(userLeft.x, userLeft.y)));
  particles.add(new Particle(new PVector(userRight.x, userRight.y)));
 particles.add(new Particle(new PVector(mouseX, mouseY)));

//si on est sur la tete
if((userLeft.y<userHead.y) && (userRight.y<userHead.y) && (userRight.x-userLeft.x)<10 ){
  growers.add(new Grower(userHead.x, height, 20));
}
 //particles
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
//--

//    
  }
  
  class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    lifespan = 55.0;
  }

  void run() {
    update();
    //display();
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0;
  }

  // Method to display
  void display() {
    stroke(0, lifespan);
    strokeWeight(2);
    fill(127, lifespan);
    ellipse(location.x, location.y, 12, 12);
  }

  // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}
  
}

