

class Board {

  int[][] oldState;
  int[][] newState;
  int rows, cols;
  int res;
  int spawnType;

  public Board(int rows, int cols, int res) {
    this.oldState = new int[rows][cols];
    this.newState = new int[rows][cols];

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        this.oldState[i][j] = 0;
        this.newState[i][j] = 0;
      }
    }

    this.rows = rows;
    this.cols = cols;
    this.res = res;
    this.spawnType = 0;
  }

  public void drawBoard() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (this.oldState[i][j] == 0) {
          fill(0);
          rect(j * this.res, i * this.res, this.res, this.res);
        } else if (this.oldState[i][j] == 1) {
          fill(255, 255, 0);
          rect(j * this.res, i * this.res, this.res, this.res);
        } else if (this.oldState[i][j] == 2) {
          fill(0, 0, 255);
          rect(j * this.res, i * this.res, this.res, this.res);
        }
      }
    }
  }

  public void updateBoard() {
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        this.oldState[i][j] = this.newState[i][j];
      }
    }
  }


  public void evalBoard() {
    evalSand();
    evalWater();
  }

  public void evalSand() {
    for (int i = 0; i < this.rows; i++) {
      for (int j = 0; j < this.cols; j++) {
        if (this.oldState[i][j] == 1 && i + 1 < this.rows) {
          if (this.oldState[i+1][j] == 0) {
            this.newState[i+1][j] = 1;
            this.newState[i][j] = 0;
          } else if (j + 1 < this.cols && this.oldState[i+1][j+1] == 0) {
            this.newState[i+1][j+1] = 1;
            this.newState[i][j] = 0;
          } else if (j - 1 > -1 && this.oldState[i+1][j-1] == 0) {
            this.newState[i+1][j-1] = 1;
            this.newState[i][j] = 0;
          }
        }
      }
    }
  }
  public void evalWater() {
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if (this.oldState[i][j] == 2 && i + 1 < this.rows) {
          if (this.oldState[i+1][j] == 0) {
            this.newState[i+1][j] = 2;
            this.newState[i][j] = 0;
          } else if (j + 1 < this.cols && this.oldState[i+1][j+1] == 0) {
            this.newState[i+1][j+1] = 2;
            this.newState[i][j] = 0;
          } else if (j - 1 > -1 && this.oldState[i+1][j-1] == 0) {
            this.newState[i+1][j-1] = 2;
            this.newState[i][j] = 0;
          } else {

            if (j + 1 < this.cols && this.newState[i][j+1] == 0) {
              this.newState[i][j+1] = 2;
              this.newState[i][j] = 0;
            } else if (j - 1 > -1 && this.newState[i][j-1] == 0) {
              this.newState[i][j-1] = 2;
              this.newState[i][j] = 0;
            } else {
              this.newState[i][j] = 2;
            }
          }
        }
      }
    }
  }

  public void showSpawn() {
    textSize(48);
    

    switch (this.spawnType) {
    default:
      fill(200, 100);
      text("Unselected", 10, 60);
      break;

    case 1:
      fill(200, 100, 0);
      text("Sand", 10, 60);
      break;

    case 2:
      fill(0, 0, 200);
      text("Water", 10, 60);
      break;
    }
  }



  public void setSpawn() {
    if (key == 'S' || key == 's') {
      this.spawnType = 1;
    } else if (key == 'W' || key == 'w') {
      this.spawnType = 2;
    }
  }

  public void spawn() {
    int x = (mouseX / this.res) + int(random(-5, 5));
    int y = (mouseY / this.res) + int(random(-5, 5));

    if (mousePressed && this.newState[y][x] == 0) {

      this.newState[y][x] = this.spawnType;
    }
  }
}
