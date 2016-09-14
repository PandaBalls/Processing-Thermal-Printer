//以下是图片处理相关

//图片设置
public void imgSetting(PImage m) {
  if (m.width != nl) {
    float bili = float(nl)/m.width;
    int newHeight = ceil(bili*m.height);
    m.resize(nl, newHeight);
  }
}

//8点模式处理图片数据
public byte[] printOneD(PImage p, int startLine) {
  int[] d = new int[8];
  int D=0;
  byte[] data = new byte[p.width];
  for (int x =0; x<p.width; x++) {
    for (int y=0; y<8; y++) {
      if (brightness(p.get(x, y+startLine*8)) == 0) {
        d[y] = (1 << (7-y));
      } else if (brightness(p.get(x, y+startLine*8)) == 255) {
        d[y] = (0 <<(7-y));
      }
    }
    D=0;
    for ( int i=0; i<8; i++) {
      D = D | d[i];
    }
    data[x] = byte(D);
  }
  return data;
}

//32点模式处理图片数据
public byte[] printDoubleD(PImage p, int startLine) {
  int[] d = new int[8];
  int D=0;
  byte[] data = new byte[nl*3];
  for (int x = 0; x<nl; x++) {
    for (int r=0; r<3; r++) {
      for (int y=0; y<8; y++) {
        if (p.get(x, (y+8*r)+startLine*24) == color(0) ) {
          d[y] = (1 << (7-y));
        } else if (p.get(x, (y+8*r)+startLine*24) == color(255)) {
          d[y] = (0 <<(7-y));
        }
      }
      D=0;
      for (int i=0; i<8; i++) {
        D = D | d[i];
      }
      data[x*3+r] = byte(D);
    }
  }
  return data;
}