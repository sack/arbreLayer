void animDebut()
{
    background(0);
    smooth();
     println(fade);
     
     
     
     if (fade){
         if (fadein){
           
         fill(0,aIn); // use black with alpha 10
         aIn=aIn+2;
         rect(0,0,width,height);
          image(bg,0,0);
         }else{
         image(front, 0, 0);
         fill(0,map(balls.size(),numBubbles,0,255,0)); // use black with alpha 10
         rect(0,0,width,height);
         println(balls.size());
         image(bg,0,0);
         }
      

        for (int i = balls.size()-1; i >= 0; i--) {
          Bubble bll = (Bubble) balls.get(i);
            bll.update();
            bll.render();
            if ( bll.loc.y < 0) {
               // bubbles[i].reset();
              balls.remove(i);
              fadein=false;
             }
        }
        if (balls.size()==0)
          fade=false;
          
          
    }else{
    
      mode="normal";
    }
    
}
