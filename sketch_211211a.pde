import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;
//float circlecolour = 255; 
float circlecolourRED = random (0, 255);
float circlecolourGREEN = random (0,255);
float circlecolourBLUE = random (0, 255); 
float circleX; 
float circleY; 
float xspeed = 10;
float yspeed = 10;

Minim minim;
AudioOutput out;
int shapelength;
PImage img;

void setup()
{
  size(1600, 1000, P3D);
  img = loadImage ("galaxy.jpg");
  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO);
  shapelength = 120;
    circleX = 800;
    circleY = 500;
}

void draw()
{
  image(img, 0, 0, width, height);
  stroke(255);
  for (int i = 0; i < out.bufferSize() - 1; i++)
  {
    float x1 = map(i, 0, out.bufferSize(), 0, width);
    float x2 = map(i+1, 0, out.bufferSize(), 0, width);
    float x3 = map(i+1, 0, out.bufferSize(), 0, width);
    float x4 = map(i+1, 0, out.bufferSize(), 0, width);

    line(x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line(x1, 150 + out.left.get(i)*50, x2, 150 + out.left.get(i+1)*50);
    line(x1, 250 + out.left.get(i)*50, x2, 250 + out.left.get(i+1)*150);
    line(x1, 350 + out.left.get(i)*50, x2, 350 + out.left.get(i+1)*550);
    line(x1, 450 + out.left.get(i)*50, x2, 450 + out.left.get(i+1)*200);
    line(x1, 550 + out.right.get(i)*50, x2, 550 + out.right.get(i+1)*200);
    line(x1, 650 + out.right.get(i)*50, x2, 650 + out.right.get(i+1)*50);
    line(x1, 750 + out.right.get(i)*50, x2, 750 + out.right.get(i+1)*550);
    line(x1, 850 + out.right.get(i)*50, x2, 850 + out.right.get(i+1)*50);
    line(x1, 950 + out.right.get(i)*50, x2, 950 + out.right.get(i+1)*650);
    //ver
    line(50 + out.right.get(i)*50, x1, 50 + out.right.get(i+1)*650, x2);
    line(150 + out.right.get(i)*50, x1, 150 + out.right.get(i+1)*150, x2);
    line(250 + out.right.get(i)*50, x1, 250 + out.right.get(i+1)*350, x2);
    line(350 + out.right.get(i)*50, x1, 350 + out.right.get(i+1)*150, x2);
    line(450 + out.right.get(i)*50, x1, 450 + out.right.get(i+1)*50, x2);
    line(550 + out.right.get(i)*50, x1, 550 + out.right.get(i+1)*250, x2);
    
    line(650 + out.right.get(i)*50, x1, 650 + out.right.get(i+1)*150, x2);
    line(750 + out.right.get(i)*50, x1, 750 + out.right.get(i+1)*50, x2);
    line(850 + out.right.get(i)*50, x1, 850 + out.right.get(i+1)*650, x2);
    line(950 + out.right.get(i)*50, x1, 950 + out.right.get(i+1)*250, x2);
    line(1050 + out.right.get(i)*50, x1, 1050 + out.right.get(i+1)*850, x2);
    line(1150 + out.right.get(i)*50, x1, 1150 + out.right.get(i+1)*50, x2);
    line(1250 + out.right.get(i)*50, x1, 1250 + out.right.get(i+1)*1050, x2);
    line(1350 + out.right.get(i)*50, x1, 1350 + out.right.get(i+1)*50, x2);
    line(1450 + out.right.get(i)*50, x1, 1450 + out.right.get(i+1)*850, x2);
    line(1550 + out.right.get(i)*50, x1, 1550 + out.right.get(i+1)*150, x2);
    line(1650 + out.right.get(i)*50, x1, 1650 + out.right.get(i+1)*50, x2);
  }

  fill (circlecolourRED,circlecolourGREEN, circlecolourBLUE );
  ellipse(circleX, circleY, 220, 220);
    circleX= circleX+xspeed;
    circleY= circleY+yspeed;
    
    if (circleX> width-110 || circleX<110) {
  //Turn around
  xspeed = xspeed *-1;
    }
      if (circleY> height- 110|| circleY<110){
  //Turn around
  yspeed = yspeed *-1;
    } 
}

void keyPressed()
{
  SineWave mySine;
  MyNote newNote;

  float pitch = 0;
  switch(key) {
  case 'z': 
    pitch = 262;  
    break;
  case 's': 
    pitch = 277; 
    break;
  case 'x': 
    pitch = 294; 
    break;
  case 'd': 
    pitch = 311; 
    break;
  case 'c': 
    pitch = 330; 
    break;
  case 'v': 
    pitch = 349; 
    break;
  case 'g': 
    pitch = 370; 
    break;
  case 'b': 
    pitch = 392; 
    break;
  case 'h': 
    pitch = 415; 
    break;
  case 'n': 
    pitch = 440; 
    break;
  case 'j': 
    pitch = 466; 
    break;
  case 'm': 
    pitch = 494; 
    break;
  case ',': 
    pitch = 523; 
    break;
  case 'l': 
    pitch = 554; 
    break;
  case '.': 
    pitch = 587; 
    break;
  case ';': 
    pitch = 622; 
    break;
  case '/': 
    pitch = 659; 
    break;
  }

  if (pitch > 0) {
    newNote = new MyNote(pitch, 0.2);
  }
}

void stop()
{
  out.close();
  minim.stop();

  super.stop();
}

class MyNote implements AudioSignal
{
  private float freq;
  private float level;
  private float alph;
  private SineWave sine;

  MyNote(float pitch, float amplitude)
  {
    freq = pitch;
    level = amplitude;
    sine = new SineWave(freq, level, out.sampleRate());
    alph = 0.9;
    out.addSignal(this);
  }

  void updateLevel()
  {
    circlecolourRED = random (0, 255);
    circlecolourGREEN = random (0,255);
    circlecolourBLUE = random (0, 255); 
    level = level * alph;
    sine.setAmp(level);

    if (level < 0.01) {
      out.removeSignal(this);
      shapelength = 120;
    }
  }

  void generate(float [] samp)
  {
    sine.generate(samp);
    updateLevel();
  }

  void generate(float [] sampL, float [] sampR)
  {
    sine.generate(sampL, sampR);
    updateLevel();
  }
}
