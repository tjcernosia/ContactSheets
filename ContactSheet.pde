PGraphics pg;
Frame[] frames = new Frame[42];
int xFrames = 7;
int yFrames = 6;
int frameCounter = 0;
int totalFrames = 111;

int pgWidth = 3300;
int pgHeight = 2550;

String imgPrefix = "Frames/frame";
String imgFormat = ".png";
String exportPrefix = "Sheets/sheet";
String exportFormat = ".png";

void setup(){
  size(0, 0);
  noLoop();
  
  for(int i = 0, count = 0; i < yFrames; i++){
    for(int j = 0; j < xFrames; j++, count++){
      println(i*414, j*434);
      frames[count] = new Frame(j*434, i*414);
      frames[count].setId(count);
    }
  }
  
}

void draw(){
  export();
}

void export(){
  while(frameCounter < totalFrames){
    pg = createGraphics(pgWidth, pgHeight);
    int startFrame = frameCounter;
    for(int i = 0; i < frames.length && frameCounter < totalFrames; i++){
      //println("FRAME" + frameCounter);
      frames[i].setImg(loadImage(imgPrefix + frameCounter + imgFormat));
      frames[i].draw();
      frameCounter++;
    }
    pg.save(exportPrefix + startFrame + "-" + frameCounter + exportFormat);
  }
  println("FINISHED");
  exit();
}
