
FireworksParticle[] fireworks;

int NUM_PARTICLES = 200;



void fireworksDisplay() {  


  noStroke();

  //etoiles 
  fill (253, 251, 1, random(50, 255));
  ellipse (800, 200, 3, 3);
  fill (253, 251, 1, random(20, 255));
  ellipse (300, 150, 5, 5);
  
  IntVector userList = new IntVector();
  context.getUsers(userList);
 
  for (int u=0; u<userList.size(); u++) { // <2>
    int userId = userList.get(u);

    if (context.isTrackingSkeleton(userId)) {
      getUserCoords(userId);

      if ((userLeft.y<userHead.y) && (userRight.y<userHead.y) && (userRight.x-userLeft.x)<20 ) {
        fireworks = new FireworksParticle[NUM_PARTICLES];
        for (int t = 0; t < NUM_PARTICLES; t++) {
          fireworks[t] = new FireworksParticle(userLeft.x,userLeft.y);
        }
      }
    }
     
 
  
 
  }
      if (fireworks != null) {
          for (int s  = 0; s < NUM_PARTICLES; s++) {
            fireworks[s].exist();
          }
     }
}


public class FireworksParticle {
  float x, y;
  float vx, vy;
  float ax, ay;

  public FireworksParticle(float xUser,float yUser) {
    x = xUser;
    y=yUser;
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






