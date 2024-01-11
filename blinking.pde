
/*
  fill(0);
  beginShape();
  vertex(0, 0);
  vertex(0, height/2 + lid);
  bezierVertex(width/4, height/6  + lid, width/4 + width/2, height/6  + lid, width, height/2 + lid);
  vertex(width, 0);
  endShape();
  
  beginShape();
  vertex(0, height);
  vertex(0, height/2  - lid);
  bezierVertex(width/4, height - height/6 - lid, width/4 + width/2, height - height/6 - lid, width, height/2 - lid);
  vertex(width, height);
  endShape();
*/

void blinking()
{  
  if (blink)
  {
    fill(0);
    rect(0, 0, width, height);
  }
}
