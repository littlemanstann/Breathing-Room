class Lineman
{
  PVector headlines[] = new PVector[100];
  int necklines;
  float radius;
  
  Lineman(int numlines)
  {
    numlines = 4;
  }
  
  void drawme()
  {
    for (int i = 0; i < 100; i++)
    {
      radius = width/2 - 50;
      headlines[i] = new PVector(random(width/2 - 50, width/2 + 50), random(height/2 - 50, height/2 + 50));
    }
    
    stroke(255);
    for (int i = 0; i < 99; i++)
      line(headlines[i].x, headlines[i].y, headlines[i + 1].x, headlines[i + 1].y);
  }
}
