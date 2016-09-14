String fileName = "sorry.bmp";
PImage img;
int newImgWidth, newImgHeight;
String yymmdd="";
int threshold = 120;
byte[] nLH;
String imgInfo;


void setup() {
  fullScreen();
  img = loadImage(fileName);
  img.resize(nl,0);
  //imgSetting(img);
  background(222);
  orientation(PORTRAIT);
  btSetting();
  guiSetting();
}

void draw() {
  yymmdd = year()+"-"+month()+"-"+day();
  display();
  //checkConnection();
}

public void keyPressed() {
  if (key == 10 && BTstatus) {
    resetPrinter();
    minLine();
    printImage(img);
    printString(yymmdd);
    rollUp();
  } else   if (key =='p' && !BTstatus) {
    BTselection();
  } else if (key == 'r') { //重置打印机
    resetPrinter();
    minLine();
  }
}