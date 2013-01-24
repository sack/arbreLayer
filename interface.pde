int transparency1=127;

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
  tint(255,transparency1);
  image(bgstars,0,0);
   image(bg,0,0);
  if(transparency1 < 0){
    transparency1--;
  }
  
}
}

