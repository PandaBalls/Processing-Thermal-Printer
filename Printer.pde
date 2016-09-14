//以下是热敏打印机的各种方法和设置

int nl = 384; //打印机横向点数384点
int nh = 1; //不知道搞什么的
int mode = 24; //打印机发热条的点数8 或者 24

//初始化打印机
public void resetPrinter() {
  byte[] reset = {0x1B, '@'};
  bt.broadcast(reset);
  println("Print Reset!");
}

//设置字符反色
public void setInverse(boolean bool) {
  byte[] setting = {0x1D, 'B', byte(bool?1:0)};
  bt.broadcast(setting);
}

//上滚纸条
public void rollUp() {
  byte[] setting = {0x1B, 'J', byte(200)};
  bt.broadcast(setting);
  println("Roll UP");
}


//换行
public void newLine(int n) {
  byte[] setting = new byte[n];
  for (int i=0; i<n; i++) {
    setting[i] =  byte(10);
  }
  bt.broadcast(setting);
}

//设置最小行间距
public void minLine() {
  byte[] setting = {0x1B, '3', byte(0)};
  bt.broadcast(setting);
  println("minLine setted!");
}

//打印图片
public void printImage(PImage p) {
  int numD = ceil(p.height/24);
  for (int n = 0; n<numD; n++) {
    byte[] printData = printDoubleD(p, n);
    byte[] start = {0x1b, '*', byte(33), byte(nl), byte(nh)};
    bt.broadcast(start);
    bt.broadcast(printData);
    background(255, 0, 0);
  }
  newLine(1);
  println("Print Data Sent!");
}

//打印字符
public void printString(String s) {
  byte[] data = s.getBytes();
  bt.broadcast(data);
  newLine(1);
}