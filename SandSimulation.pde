int W = 800;
int H = 800;

int DIM = 20;
int R = H / DIM;
int C = W / DIM;

Board myBoard = new Board(R, C, DIM);

void setup() {
  size(800, 800);
}

void draw() {
  background(255);
  myBoard.drawBoard();
  myBoard.updateBoard();
  myBoard.evalBoard();
  myBoard.setSpawn();
  myBoard.spawn();
}
