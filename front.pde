//ArrayList<Particle> particles;

PShape s;


class MyLayer extends Layer {

  MyLayer(PApplet parent) {
    super(parent); // This is necessary!
    //particles = new ArrayList<Particle>();
    front=loadImage("bas.png");
   // s = loadShape("premierplan2.svg");
  }
   
  void draw() {  
    
    smooth();
    background(0,0); // clear the background every time, but be transparent
    // now draw something
    
    
    noStroke();
    //Remplacer le random par un noise pour avoir un truc plus continue
    
    fill (253,251,1,random(50,255));
    ellipse (800,200,3,3);
    fill (253,251,1,random(20,255));
    ellipse (mouseX,mouseY,5,5);
    image(front,0,height-338);
   //shape(s, 0, 0, width,height);
     //--Particles
// particles.add(new Particle(new PVector(mouseX,mouseY)));
//   
//  Iterator<Particle> it = particles.iterator();
//  while (it.hasNext()) {
//    Particle p = it.next();
//    p.run();
//    p.display();
//    if (p.isDead()) {
//      it.remove();
//    }
//  }
 //--
    
    
    
  }

}
