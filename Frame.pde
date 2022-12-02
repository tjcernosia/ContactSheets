class Frame{
  float x, y;
  PImage img; 
  
  int id;
  
  public Frame(){

  }
  
  public Frame(PImage img){
    this();
    this.img = img;
  }
  
  public Frame(float x, float y){
    this();
    this.x = x;
    this.y = y; 
  }
  
  void setImg(PImage img){
    this.img = img;
  }
  
  void setId(int id){
    this.id = id;
  }
  
  void draw(){
    float xBuffer = (frameWidth - imgWidth)/2;
    float yBuffer = (frameHeight - imgHeight)/2;
    
    pg.beginDraw();
    //border
    pg.fill(0,0);
    pg.strokeWeight(1);
    pg.rect(x,y,x+frameWidth, y + frameHeight);
    
    //img
    img.resize((int)imgWidth, (int)imgHeight);
    pg.image(img, x+xBuffer, y+yBuffer);
    
    img = null;
    
    //counter
    pg.fill(0);
    pg.textSize(30);
    pg.text(frameCounter,x,y+30);
    
    pg.endDraw();
  }
  
  void drawDebug(){
    pg.beginDraw();
    //draw frame
    pg.fill(0);
    pg.stroke(255);
    pg.strokeWeight(2);
    pg.rect(x,y,x+frameWidth, y+frameHeight);
    
    //draw image
    pg.strokeWeight(0);
    pg.fill(255);
    float xBuffer = (frameWidth - imgWidth)/2;
    float yBuffer = (frameHeight - imgHeight)/2;
    pg.rect(x+xBuffer,y+yBuffer, x + xBuffer + imgWidth, y + yBuffer + imgHeight);
    
    println("(" + x + ", " + y + ", " +  x+frameWidth + ", " + y+frameHeight + ")");
    pg.endDraw();
  }
}
