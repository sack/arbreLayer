class Grower {

  double x;
  double y;
  double lastxadjust;
  double lastyadjust;
  double size;
  double minimumsize;
  double sizecount;
  boolean dead;
  int branchchance;

  Grower(double x, double y, double size) {
    this.x = x;
    this.y = y;
    dead = false;
    this.size = size;
    lastxadjust = random(((float) -0.1), ((float) 0.1));
    // lastxadjust = random(((float) -0.1), ((float) 0.1));
    lastyadjust = random(((float) -1.0), ((float) 0.0));
    lastyadjust = -1;
    //minimumsize = (40 + (round(random(-20, 10))));
    
    minimumsize = (map(height-userHead.y, 0, height, 10, 100));
  //  println("minimumsize" + minimumsize);
    sizecount = 0;
    
    branchchance = (ceil(map(userLeft.x-userRight.x, 0, width, 1, 25)));
    
   // println("branchchance" + branchchance);
  }

  void grow() {
    if (!dead) {
      double lowerbound = lastxadjust - 0.1;
      double upperbound = lastxadjust + 0.1;
      double xadjuster = random(((float) lowerbound), ((float) upperbound));
      lowerbound = lastyadjust - 0.08;
      upperbound = lastyadjust + 0.08;
      double yadjuster = random(((float) lowerbound), ((float) upperbound));
      lastxadjust = xadjuster;
      lastyadjust = yadjuster;
      this.x = this.x + xadjuster;
      this.y = this.y + yadjuster;
      if (this.size > 1.5) {
        this.size = this.size - 0.1;
        checkBranchChance();
        branch();
      } 
      else {
        if (sizecount > minimumsize) {
          dead = true;
          placeFlower();
        } 
        else {
          sizecount++;
          checkBranchChance();
          branch();
          drawLeaf();
        }
      }
    }
  }

  void checkBranchChance() {
    if (this.size < 3) {
      //branchchance = 15;
          branchchance = (ceil(map(userLeft.x-userRight.x, 0, width, 1, 15)));

    }
    if (this.size < 2.5) {
     // branchchance = 20;
          branchchance = (ceil(map(userLeft.x-userRight.x, 0, width, 1, 20)));

    }
    if (this.size < 2) {
     // branchchance = 25;
          branchchance = (ceil(map(userLeft.x-userRight.x, 0, width, 1, 25)));

    }
    if (this.size < 1.6) {
     // branchchance = 50;
          branchchance = (ceil(map(userLeft.x-userRight.x, 0, width, 1, 50)));

    }
  }

  void placeFlower() {
    //            float fmod1 = random(((float) -1), ((float) 1));
    //            float fmod2 = random(((float) -1), ((float) 1));
    //            fill(254, 131, 162);
    //            ellipse((float) x, (float) y, 5 + fmod1, 5 + fmod2);
    //            fill(254, 197, 211, 200);
    //            ellipse((float) x - 5, (float) y, 5 + fmod1, 5 + fmod2);
    //            ellipse((float) x + 5, (float) y, 5 + fmod1, 5 + fmod2);
    //            ellipse((float) x, (float) y - 5, 5 + fmod1, 5 + fmod2);
    //            ellipse((float) x, (float) y + 5, 5 + fmod1, 5 + fmod2);


    colorMode(HSB, 360);
    float k1 = 5./3.;
    float r = 10;
    pushMatrix();
    translate((float) x, (float) y);
    noStroke();
    fill(75, .02*360, 360, 275);

    beginShape();
    float thS = random(0, 2*PI);
    for (float i = 0; i < 3*PI; i = i + 0.1) {
      vertex(r*sin(k1*i)*sin(i+thS), r*sin(k1*i)*cos(i+thS));
    }

    endShape();
    fill(61, .77*360, 360);
    ellipse(0, 0, 3, 3);
    popMatrix();
    colorMode(RGB);
    translate(0, 0);
  }
 
void drawLeaf(){ // draw a leaf as follows
// translate((float)x,(float)y);
//  float pointShift = random(-20,20); // here is a variable between -20 and 20
//  beginShape(); // start to draw a shape
//  vertex(0, 0); // begin at this point x, y
//   bezierVertex(30,30,60,40,70 + random(-20,20),50); // moving only the pointy point meant that sometimes the leaf shape would turn into a heart shape, because the control points were not also moving. So I created a variable called pointShift
//  //  bezierVertex(30,30, 60 + pointShift,40 + pointShift/2, 70 + pointShift,50); // make the pointy end of the leaf vary on the x axis (so the leaf gets longer or shorter) AND vary the y axis of the control points by the same amount. It should be possible to have 'normal' leaves, very short fat ones and very long thin ones.
//    bezierVertex(60 + pointShift,55, 30,65, 20,45); // draw the other half of the shape
//  endShape();
//translate(0,0);
 
}




  void branch() {
    int chance = round(random(1000));
    if (chance < branchchance) {
      Grower temp = new Grower(x, y, size);
      growers.add(temp);
      temp.lastxadjust = this.lastxadjust;
      temp.lastyadjust = this.lastyadjust;
      temp.sizecount = this.sizecount;
    }
  }

  void display() {
    if (!dead) {
      noStroke();
      //fill(255, 255, 255, 10);
      //ellipse((float)x,(float)y,(float)size+30,(float)size);
      fill(0);
      //ellipse((float) x-1, (float) y, (float) size+1, (float) size);
      //  fill(0,0,0);

      //fill(67,88,103);
      //ellipse((float)x,(float)y,(float)size,(float)size);
      // fill(89, 67, 36, 200); //marron
      //fill(108, 156, 46, 200); //vert
     
      fill(251, 253, 1); //jaune
      
      ellipse((float) x, (float) y, (float) size, (float) size);
    }
  }
}
