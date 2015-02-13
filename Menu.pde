class Menu {

  PFont f;


  Menu() {
    f = createFont("Arial", 16, true);
  }

  void draw() {
    textFont(f, 16);
    fill(255);
    text("MENU: Push Enter to Continue", 10, 20);

    if (Keys.ENTER) {
      hw2_gardei.killState(hw2_gardei.state);//kills current menu state
      hw2_gardei.state = 2;//starts game state
      //all data that was created and used in this class should now be non existant
    }

  }
}

