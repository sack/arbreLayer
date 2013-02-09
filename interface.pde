int transparency1=127;
boolean debug=false;

public void mousePressed() {
  if (mouseButton == LEFT) {

    // growers.add(new Grower(mouseX, mouseY, 25));
    growers.add(new Grower(width/2, height, 20));
  } 
  else {
    growers.clear();
  }
}

//
public void keyPressed() {
  if (key == 'a') {
    background(0);
    tint(255, transparency1);
    image(bgstars, 0, 0);
    image(bg, 0, 0);
    if (transparency1 < 0) {
      transparency1--;
    }
  }
  if (key == 'd' || key == 'D')
    debug=!debug;

  if (key == 's' || key == 'S') {   
    if (!fade) {
      for (int i = 0; i < numBubbles; i++) {
        balls.add(new Bubble());  // Start by adding one element
      }
    }
    fade=true;
    fadein=true;
    aIn=0;
    mode="debut";
  }
   if (key == 'e' || key == 'E') {   
    if (!fade) {
      for (int i = 0; i < numBubbles; i++) {
        balls.add(new Bubble());  // Start by adding one element
      }
    }
    fade=true;
    fadein=true;
    aIn=0;
    mode="efface";
  }
  
}

