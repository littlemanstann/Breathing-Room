/*
class Scenechange
{
  int scene;
  
  Scenechange(int n)
  {
    scene = n;
  }
  
  if (counter > 120)
  
}
*/

void backgroundchange()
{
  // Blood scene
  if (counter == 210)
    blood.play();
  if (counter == 240)
  {
    bg++;
    background[bg].play();
  }
  // Transition
  if (counter == 270)
    bg++;
  // Door Scene
  if (counter == 360)
  {
    bg++;
    background[bg].play();
    door.play();
  }
  if (counter == 375)
    mcenter.play();
  if ((counter > 380) && (counter < 410))
  {
    fill(0);
    text("DON'T BREATH", random(100, 200), random(200, 400));
    text("STOP BREATHING", random(100, 200), random(200, 400));
  }
  if (counter == 420)
    bg++;
}

void deathscreen()
{
  fill(255);
  rect(0, 0, width, height);
  
  fill(0);
  textSize(40);
  text("You are no longer breathing.", width/2, height/2); 
  textSize(20);
  text("Tip: Don't breath when MC appears.", width/2, height/2 + 30);
  
  if ((mouseX > width/2) && (mouseX < width/2 + 100) && (mouseY < height/2 + 200) && (mouseY > height/2 + 170))
    fill(200, 20, 20);

  text("Try again?", width/2, height/2 + 200);
}
