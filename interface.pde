
public void mousePressed() {
  if (mouseButton == LEFT) {
   
    // growers.add(new Grower(mouseX, mouseY, 25));
    growers.add(new Grower(width/2, height, 20));
  } 
  else {
    growers.clear();
     
   background(0);
  
   image(bgstars,0,0);
   image(bg,0,0);
 
  }
}

//
//public void keyPressed() {
//  if (key == 'a') {
//  }
//  if (key == 'b') {
//  }
//}
