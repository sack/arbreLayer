
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
    


    Iterator<Particle> it = particles.iterator();
    while (it.hasNext ()) {
      Particle p = it.next();
      p.run();
      if (p.isDead()) {
        it.remove();
      }
    }
  }



  void keyPressed() {
   
  }
}






