
void breathe_in()
{
  if ((mouseY < height/2) && (breathing))
  {
  breathe++;
    if (breathe > 100)
      breathe = 100;
      
    if (breathe_out.isPlaying())
    {
      breathe_out.stop();
    }
    
    if (!breathe_in.isPlaying())
      breathe_in.play();
    
    heightchange += 1.5;
    if (heightchange > 50)
      heightchange = 50;
  }
}

void breathe_out()
{
  if ((mouseY > height/2) && (breathing))
  {
  breathe--;    
    if (breathe < 0)
      breathe = 0;
    
    if (breathe_in.isPlaying())
    {
      breathe_in.stop();
    }
    
    if (!breathe_out.isPlaying())
      breathe_out.play();
      
    heightchange -= 1.5;
    if (heightchange < -50)
      heightchange = -50;
  }
}

void breathbar()
{
  fill(255);
  text(breathe, 50, 50);
}
