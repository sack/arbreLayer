
ArrayList<Particle> particles;
color fin;
float amt = 0.0;
color partColor;


void kinectDisplay() {  

  context.update();

  IntVector userList = new IntVector();
  context.getUsers(userList);
  if (debug)
    text("nbUsers : "+ userList.size(),50,50);

  for (int i=0; i<userList.size(); i++) { // <2>
    int userId = userList.get(i);

    if (context.isTrackingSkeleton(userId)) {
      getUserCoords(userId);
      //ellipse(userHead.x, userHead.y, 8, 8);
      
   fill (253, 251, 1, random(20, 255));
   ellipse(userLeft.x, userLeft.y, 5, 5);
   ellipse(userRight.x, userRight.y, 5, 5);

      particles.add(new Particle(new PVector(userLeft.x, userLeft.y)));
      particles.add(new Particle(new PVector(userRight.x, userRight.y)));
      particles.add(new Particle(new PVector(mouseX, mouseY)));



      //si on est sur la tete
      if ((userLeft.y<userHead.y) && (userRight.y<userHead.y) && (userRight.x-userLeft.x)<10 ) {
        growers.add(new Grower(userHead.x, height, 20));
      }
    }
  }

  //particles
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext ()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
  //--

  //
}

