void mc_chance()
{ 
  if (mccooldown == 1000){}
  else if (mccooldown < 0)
    mcappear = true;
  else
    mccooldown--;
}

void mc_enter()
{ 
  if (mcappear)
  {   
    if (mctimer == 1)
    {
      mc[0].jump(1);
      mc[0].play();
    }
    
    image(mc[mcanimate], 170 + 24*mcanimate, 297 + heightchange + variation);
    
    if (mctimer == 11)
      mcenter.play();
    
    if (mctimer == 16)
      mc[0].pause();
    
    if (mctimer == 40)
    {
      mcanimate = 1;
      mc[1].play();
    }
    
    if (mctimer == 48)
    {
      mcappear = false;
      mcanimate = 0;
      mc[0].stop();
      mc[1].stop();
      mctimer = 0;
      mccooldown = (int)random(10, 100);
    }
    
    if ((mctimer > 15) && (mctimer < 40) && (breathing))
    {
      mcscare.play();
      mccooldown = 1000;
      mctimer = 0;
      mcanimate = 0;
      mc[0].stop();
      mc[1].stop();
      mc[2].loop();
      mcappear = false;
      mcjumpscare = true;
    }
    mctimer++;
  }
  
  if (mcjumpscare)
  {     
    if (mctimer > 25)
    {
      scene = 4;
      mcscare.stop();
    }
    
    image(mc[2], 0,0);
    screenshake = random(-50, 50);
    mctimer++;    
  }
}
