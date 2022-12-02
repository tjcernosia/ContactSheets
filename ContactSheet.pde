PGraphics pg;
int totalFrames = 826;

int inchWidth = 17;
int inchHeight = 22;
int ppi = 425;

float imgWidth = 1.42*ppi;
float imgHeight = .94*ppi;
float frameWidth = imgWidth + 12;
float frameHeight = imgHeight + imgHeight/3.5;

int pgWidth = inchWidth * ppi;
int pgHeight = inchHeight * ppi;

int xFrames = (int)((pgWidth - 100)/frameWidth);
int yFrames = (int)(pgHeight/frameHeight);
Frame[] frames = new Frame[xFrames * yFrames];

int frameCounter = 0;

String imgPrefix = "Frames/draft2/frame";
String imgFormat = ".jpg";
String exportPrefix = "Sheets/sheet";
String exportFormat = ".png";

void setup(){
  size(0, 0);
  noLoop();
  
  for(int i = 0, count = 0; i < yFrames; i++){
    for(int j = 0; j < xFrames; j++, count++){
      //println(i*414, j*434);
      frames[count] = new Frame(100 + j*frameWidth, i*frameHeight);
      frames[count].setId(count);
    }
  }
  
}

void draw(){
  println("Start");
  println("imgWidth: " + imgWidth);
  println("imgHeight: " + imgHeight);
  println("ppi: " + ppi);
  export();
}

void export(){
  while(frameCounter < totalFrames){
    pg = createGraphics(pgWidth, pgHeight);
    println(pg.width + " " + pg.height);
    int startFrame = frameCounter;
    for(int i = 0; i < frames.length && frameCounter < totalFrames; i++){
      //println("FRAME" + frameCounter);
      frames[i].setImg(loadImage(imgPrefix + frameCounter + imgFormat));
      frames[i].draw();
      frameCounter++;
    }
    println("FINISHED: " + startFrame + "-" + frameCounter);
    pg.save(exportPrefix + startFrame + "-" + frameCounter + exportFormat);
  }
  println("FINISHED");
  exit();
}
