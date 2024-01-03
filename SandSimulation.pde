int W = 1000;
int H = 1000;

int DIM = 10;
int R = H / DIM;
int C = W / DIM;

Board myBoard = new Board(R, C, DIM);

void setup() {
  size(1000, 1000);
}

void draw() {
  background(255);
  myBoard.drawBoard();
  myBoard.updateBoard();
  myBoard.evalBoard();
  myBoard.setSpawn();
  myBoard.showSpawn();
  myBoard.spawn();
}
