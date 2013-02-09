void animEfface()
{
  
     
     
     
     if (fade){
         if (fadein){
           background(back);
           image(front, 0, 0);
         fill(0,aIn); // use black with alpha 10
         aIn=aIn+2;
         rect(0,0,width,height);
         println(aIn);
          
         }else{
            background(0);
       
        
         println(balls.size()+"->"+map(balls.size(),0,numBubbles,0,255));
         //image(bg,0,0);
          image(bgstars, 0, 0);
        image(bg, 0, 0);
         image(front, 0, 0);
         
          fill(0,map(balls.size(),0,numBubbles,0,255)); // use black with alpha 10
         rect(0,0,width,height);
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
         background(0);
        image(bgstars, 0, 0);
        image(bg, 0, 0);
      back=get();
      mode="normal";
      growers.clear();
    }
    
}
