



class MyMagic extends Layer {
ArrayList<Particle> particles;
color fin;
float amt = 0.0;
color partColor;


  MyMagic(PApplet parent) {
    super(parent); // This is necessary!
    //particles = new ArrayList<Particle>();

    //s = loadShape("premierplan.png");
  }

  void setup() {
    //size(400, 400);
    particles = new ArrayList<Particle>();
    smooth();
    fin = color(random(255), random(255), random(255));
  }

  void draw() {  

    background(0, 0); // clear the background every time, but be transparent

    particles.add(new Particle(new PVector(userLeft.x, userLeft.y)));
        particles.add(new Particle(new PVector(userRight.x, userRight.y)));


    Iterator<Particle> it = particles.iterator();
    while (it.hasNext ()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;

  Particle(PVector l) {
    //acceleration de la particule
    acceleration = new PVector(0, 0.02);
    velocity = new PVector(random(-1, 1), random(-2, 0));
    location = l.get();
    lifespan = 25.0;
  }

  void run() {
    update();
    display();
  }

  // mise a jour de la position
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 1.0;
  }

  // Affichage de la particule
  void display() {
    noStroke();
  //  partColor = lerpColor(deb,fin,amt);
  //a tester ici les couleurs des particules
 //arc en ciel : 
 // fill(random(10),random(220),random(255));
 //vert bleu
   fill(random(10),random(220),random(255));
    //ellipse(location.x, location.y, 2, 2);
   rect(location.x, location.y, 2, 2);
  }

  // particule encore utile
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}


  void keyPressed() {
   
  }
}






