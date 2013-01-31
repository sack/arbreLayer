



class MyFireworks extends Layer {

  Particle[] particles;

  int NUM_PARTICLES = 200;

  MyFireworks(PApplet parent) {
    super(parent); // This is necessary!
    //particles = new ArrayList<Particle>();

    //s = loadShape("premierplan.png");
  }

  void setup() {
   
  }

  void draw() {  

    //smooth();
    background(0, 0); // clear the background every time, but be transparent
    
      noStroke();
    //Remplacer le random par un noise pour avoir un truc plus continue

      fill (253, 251, 1, random(50, 255));
    ellipse (800, 200, 3, 3);
    fill (253, 251, 1, random(20, 255));
    ellipse (300, 150, 5, 5);
    
    

    if ((userLeft.y<userHead.y) && (userRight.y<userHead.y) && (userRight.x-userLeft.x)<10 ) {
      particles = new Particle[NUM_PARTICLES];
      for (int i = 0; i < NUM_PARTICLES; i++) {
        particles[i] = new Particle();
      }
    }



    if (particles != null) {
      for (int i = 0; i < NUM_PARTICLES; i++) {
        particles[i].exist();
      }
    }
  }


  public class Particle {
    float x, y;
    float vx, vy;
    float ax, ay;

    public Particle() {
      x = userLeft.x;
      y = userLeft.y;
      vx = vy = 0f;
      ax = random(-0.4, 0.4);
      ay = random(-0.4, 0.4);
    }

    public void exist() {
      vx += ax;
      vy += ay;
      x += vx;
      y += vy;
      noStroke();
      fill(251, 253, 1, random(20, 255));
      ellipse(x, y, 2, 2);
    }
  }


  void keyPressed() {
    particles = new Particle[NUM_PARTICLES];
    for (int i = 0; i < NUM_PARTICLES; i++) {
      particles[i] = new Particle();
    }
  }
}







