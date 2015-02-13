class Camera {
  Vec2 pos;

  PMatrix2D matrix = new PMatrix2D();

  void update(Vec2 pos) {
    
    matrix.reset();
    matrix.translate(width/2, height/2);//2 move to center of screen.
    matrix.scale(2);//zoom in
    matrix.translate(-pos.x, -pos.y); // 1 move to world origin
  }
  PVector transformInverseMatrix(PVector v) {
    v = v.get();

    PMatrix2D im = matrix.get(); //copy matrix
    im.invert();
    im.mult(v, v);
    return v;
  }
}

