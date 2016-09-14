import ketai.ui.*;
import ketai.net.*;
import android.content.Intent;
import android.os.Bundle;
import ketai.net.bluetooth.*;

KetaiList klist;
String info="";
int Tsize=33;

//GUI setting;
public void guiSetting() {
  textSize(Tsize);
}

//show keyboard
public void mousePressed() {
  KetaiKeyboard.show(this);
}

public void display() {
  fill(122);
  noStroke();
  rect(0, 0, width, height);
  //bluetooth connected
  if (BTstatus == true) {
    info = "Printer Connected!\n";
    imageMode(CENTER);
    image(img, width/2, height/6);
  } else if (BTstatus == false) {
    checkConnection();
    devicesDiscovered = bt.getDiscoveredDeviceNames();
    info = "No Printer Connected!\nPress 'p' To Choose Printer\n\nDevices Discovered:\n";
    for (int i = 0; i<devicesDiscovered.size(); i++) {
      info += "["+(i+1)+"]"+ devicesDiscovered.get(i) + "\n";
    }
  }
  fill(#559e83);
  text(info, 60, 60);
}

//list selection
void onKetaiListSelection(KetaiList klist) {
  String name = klist.getSelection();
  bt.connectToDeviceByName(name);
  checkConnection();
  klist = null;
}