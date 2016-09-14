
boolean BTstatus =false;
ArrayList<String> devicesConnected = new ArrayList();
ArrayList<String> devicesPaired= new ArrayList();
ArrayList<String> devicesDiscovered= new ArrayList();
KetaiBluetooth bt;

public void btSetting() {
  bt.start();
  bt.discoverDevices();
}

public void onCreate(Bundle savedInstanceState) {
  super.onCreate(savedInstanceState);
  bt = new KetaiBluetooth(this);
}

public void onActivityResult(int requestCode, int resultCode, Intent data) {
  bt.onActivityResult(requestCode, resultCode, data);
}


//check connection of printer
public void checkConnection() {

  devicesConnected = bt.getConnectedDeviceNames();
  if (devicesConnected.size() == 0) {
    BTstatus = false;
  }
  if (devicesConnected.size()>0) {
    BTstatus = true;
  }
}

//select paired device
public void BTselection() {
  klist =new KetaiList(this, bt.getDiscoveredDeviceNames());
}