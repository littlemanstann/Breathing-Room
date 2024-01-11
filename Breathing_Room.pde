// "Breathing Room"
// IS VERY UNFINISHED!!!

// Gif Loading
import gifAnimation.*;
Gif background[] = new Gif[5];
Gif mc[] = new Gif[3];
Gif cutie[] = new Gif[2];

// Sound Loading
import processing.sound.*;
SoundFile breathe_in;
SoundFile breathe_out;
SoundFile alarm;
SoundFile scream;
SoundFile blood;
SoundFile hum;
SoundFile door;
SoundFile mcenter;
SoundFile mcscare;

PFont defaultfont;

PImage vignette;

int breathe = 50;
float heightchange = 0;
float counter = 0;
float variation = 0;
float screenshake = 0;
boolean breathing = true;
boolean blink = false;

boolean mcappear = false;
boolean mcjumpscare = false;
int mctimer = 0;
int mccooldown = (int)random(430, 450);
int mcanimate = 0;

int scene = 0;
int bg = 0;
int fade = 0;

void setup()
{
  size(1366, 768);
  frameRate(30);
   
  background[0] = new Gif(this, "data/backgrounds/initialbackground.gif");
  background[1] = new Gif(this, "data/backgrounds/bloodsplatterbackground.gif");
  background[2] = new Gif(this, "data/backgrounds/bloodbackground.gif");
  background[3] = new Gif(this, "data/backgrounds/MCentranceWITHMC.gif");
  background[4] = new Gif(this, "data/backgrounds/brokendoors.gif");
  background[0].loop();
  background[2].loop();
  background[4].loop();
  
  mc[0] = new Gif(this, "data/MC/MCcropped.gif");
  mc[1] = new Gif(this, "data/MC/MCleave.gif");
  mc[2] = new Gif(this, "data/MC/MCJumpscarecropped.gif");
  mc[0].noLoop();
  mc[1].noLoop();
  
  breathe_in = new SoundFile(this, "data/audio/breathe in1.mp3");
  breathe_out = new SoundFile(this, "data/audio/breathe out1.mp3");
  alarm = new SoundFile(this, "data/audio/Alarm Sound.mp3");
  blood = new SoundFile(this, "data/audio/Man Death.mp3");
  door = new SoundFile(this, "data/audio/Door Kick Down Break - Sound Effect for editing.mp3");
  mcenter = new SoundFile(this, "data/audio/Jumpscare Sound Effect.mp3");
  mcscare = new SoundFile(this, "data/audio/Jump Scare #1 - Sound Effect.mp3");
  
  vignette = loadImage("Vignette.png");
  defaultfont = createFont("TwCenMT-Italic-32.vlw", 32);
  textFont(defaultfont);
}

void draw()
{ 
  if (scene == 0)
  {
    counter++;
    variation = 5*sin(counter/10);
  
    if (!alarm.isPlaying())
      alarm.play();
    image(background[bg], -116 + screenshake, -66 + heightchange + variation + screenshake);
    backgroundchange();    
    
    // Tutorial Text    
    fill(255, 255, 255, fade); 
    if (counter < 120)
    {
      if (counter < 15)
        fade += 20;
      if (counter > 110)
        fade -= 40;
      text("Move the mouse up to breath in.", 100, height - 130);
      text("Move the mouse down to breath out.", 100, height - 100);
    }
    else if (counter < 240)
    {
      if (counter < 135)
        fade += 20;
      if (counter > 230)
        fade -= 40;
      text("Left-click to hold your breath.", 100, height - 130);
      text("Right-click to blink.", 100, height - 100);
    }
    
    // Monsters
    mc_chance();
    mc_enter();
    
    image(vignette, 0,0);
    
    // Breathing code
    breathe_in();
    breathe_out();
    breathbar();
    
    // Blinking code
    blinking();
  }
  
  if (scene == 4)
    deathscreen();
}

void mousePressed()
{
  if (scene == 0)
  {
    if (mouseButton == RIGHT)
      blink = true;
    if (mouseButton == LEFT)
    {
      breathing = false;
  
    if (breathe_out.isPlaying())
      breathe_out.pause();
    if (breathe_in.isPlaying())
      breathe_in.pause();
    }
  }
  
  if (scene == 4)
  {
    if ((mouseX > width/2) && (mouseX < width/2 + 100) && (mouseY < height/2 + 200) && (mouseY > height/2 + 170))
    {
      scene = 0;
      mcjumpscare = false;
      mctimer = 0;
      mc[2].stop();
      screenshake = 0;
      mccooldown = (int)random(10, 50);
    }
  } 
}

void mouseReleased()
{
  if (scene == 0)
  {
    if (mouseButton == RIGHT)
      blink = false;
    if (mouseButton == LEFT)
      breathing = true;
  }
}
