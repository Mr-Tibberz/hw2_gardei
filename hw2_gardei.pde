


//ALLEN GARDEI
//DAGD 420 PHYSICS GAME PROJECT

//THIS CLASS ACTS AS A GAMESTATE MANAGER!



//int state will determine which gamestate is updated and drawn to the screen at any given time
static int state = 1;

//Creates variables I can use to reference their prospective classes. When they are no longer in use the variable 
//is set back to null and when they are started are set to a new class of their type. 
//Theoretically this allows for garbage collection.
//They are static so they can be killed or started up from any other class as needed.

static Menu menu; //var that stores a menu object
static Game game; //var that stores a game object
static Win win; //var that stores a win object
static Lose lose; //var that stores a lose object



void setup() {
  size(800, 500);
  background(0);
}


void draw() {
  background(0);
  switch(state) {
  case 1:
    //Menu State Function 
    if (menu == null) menu = new Menu();   
    menu.draw();
    break;   

  case 2:
    //Gameplay State Function
    if (game == null) game = new Game();
    game.draw();
    break;

  case 3:
    //Win State Function
    if (win == null) win = new Win();
    win.draw();
    break;

  case 4:
    //lose state function
    if (lose == null) lose = new Lose();
    lose.draw();
    break;
  }
}



//deletes the reference to the class thus allowing the garbage collector to eat up the now unused data. in theory anyway.
static void killState(int state) {
  switch(state) {
  case 1:
    menu = null;
    break;
  case 2:
    game = null;
    break;
  case 3:
    win = null;
    break;
  case 4:
    lose = null;
    break;
  }
}

static void keys() {
}

