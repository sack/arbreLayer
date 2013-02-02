
FireworksParticle[] fireworks;

int NUM_PARTICLES = 200;



void fireworksDisplay() {  


  noStroke();
  
  //etoiles 
    fill (253, 251, 1, random(50, 255));
    ellipse (800, 200, 3, 3);
    fill (253, 251, 1, random(20, 255));
    ellipse (300, 150, 5, 5);
    


  if ((userLeft.y<userHead.y) && (userRight.y<userHead.y) && (userRight.x-userLeft.x)<10 ) {
    fireworks = new FireworksParticle[NUM_PARTICLES];
    for (int i = 0; i < NUM_PARTICLES; i++) {
      fireworks[i] = new FireworksParticle();
    }
  }



  if (fireworks != null) {
    for (int i = 0; i < NUM_PARTICLES; i++) {
      fireworks[i].exist();
    }
  }
}


public class FireworksParticle {
  float x, y;
  float vx, vy;
  float ax, ay;

  public FireworksParticle() {
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







