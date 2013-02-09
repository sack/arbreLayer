class Bubble
{
    PVector loc;
    float   speed;
    float   radius;
    float t = 0;
    float t2 = 0; 
    Bubble()
    {
        loc = new PVector( random(width), random(height)+height );
        speed = random(3, 5);
        radius = random( 1, 3);
    }
     
    void update()
    {
      t=t+0.01;
      float xpos=noise(t,loc.y);
      loc.x += map(xpos,0,1,-3,3);
      loc.y -= speed;
    }
     
    void render()
    {
        //stroke(59, 173, 224);
        //fill(59, 173, 224, 64);
//        
//        t2=t2+0.02;
//        float xpos=noise(t,loc.y);
//        fill(map(xpos,0,1,0,10),map(xpos,0,1,0,220),map(xpos,0,1,0,255));
noStroke();
        fill(random(10),random(220),random(255));
        for (int i = 1; i < 3; i++) {
            ellipse( loc.x, loc.y, radius, radius);
        }
    }
     
    void reset()
    {
//        loc.x = random(width);
//        loc.y = height + 50;
//        speed = random(0.5, 2);
//        radius = random( 5, 10 );

      println("done");
    }
     
}


