import org.jbox2d.common.*;
import org.jbox2d.collision.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.callbacks.*;

class Game {

  PFont f;
  int health = 100;

  Camera cam = new Camera();
  World world;
  float timeStep = 1/60.0;
  Vec2 pos = new Vec2(0, 0);

  Body ship;
  Body ground;

  Game() {
    f = createFont("Arial", 16, true);
    world = new World(new Vec2(0, 0));
    ground = makeABox(new Vec2(400, 300), 200, 10, true); //platform
    ship = makeABox(new Vec2(400, 50), 10, 10, false);
    ship.setAngularVelocity(99999);
  }

  void update() {
    world.step(timeStep, 6, 2);
    cam.update(ship.getPosition());
    if (Keys.canMakeBox) {
      Keys.mouse = cam.transformInverseMatrix(Keys.mouse);
      makeABox(new Vec2(Keys.mouse.x, Keys.mouse.y), 10, 10, false);
      Keys.canMakeBox = false;
    }
    if (Keys.W) {
      hw2_gardei.killState(hw2_gardei.state);//kills current menu state
      hw2_gardei.state = 3;//starts win state
    }
  }

  void draw() {
    textFont(f, 16);
    fill(255);
    text("HP: " + health, 10, 20);

    //UPDATES
    update();
    //DRAW
    background(0);
    pushMatrix();
    applyMatrix(cam.matrix);
    for (Body body = world.getBodyList (); body != null; body = body.getNext()) {
      drawBody(body);
    }
    popMatrix();
  }

  void drawBody(Body body) {
    PolygonShape ps = (PolygonShape)body.getFixtureList().getShape();
    Vec2[] verts = ps.getVertices();
    Vec2 pos = body.getPosition();
    fill(255);
    noStroke();
    if (body.isAwake()) fill(255);
    else fill(127);
    pushMatrix();  
    translate(pos.x, pos.y);
    rotate(body.getAngle());
    beginShape();
    for (int i = 0; i < ps.getVertexCount (); i++) {
      vertex(verts[i].x, verts[i].y);
    }
    endShape();
    popMatrix();
  }

  Body makeABox(Vec2 pos, float w, float h, boolean isFixed) {
    BodyDef def = new BodyDef();
    def.type = isFixed ? BodyType.STATIC : BodyType.DYNAMIC;
    def.position = pos;

    Body body = world.createBody(def);

    PolygonShape shape = new PolygonShape();
    shape.setAsBox(w, h);

    FixtureDef fixture = new FixtureDef();
    fixture.shape = shape;
    fixture.density = 1;
    fixture.friction = .5;
    fixture.restitution = 0;

    body.createFixture(fixture);
    return body;
  }

  public class CollisionHandler implements ContactListener {
    
  void beginContact(Contact contact){
    }
    
    void endContact(Contact contact){
    }
    
   void preSolve(Contact contact, Manifold oldManifold){
    }
    
    void postSolve(Contact contact, ContactImpulse impules){
    }
    
    
  }
  
   
}




