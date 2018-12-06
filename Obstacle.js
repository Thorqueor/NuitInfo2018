class Obstacle {
  constructor(x, y) {
    let sprite = getImage("creatures/Hopper-Happy");;
    let height = sprite.height;
    let width = sprite.width;
    this.x = x;
    this.y = y;
  }

  function getHeight(){
    return height;
  }

  function getWidth(){
    return width;
  }

  function getX(){
    return x;
  }


  function setX(let value){
    this.x = value;
  }


  function getY(){
    return y;
  }


  function setY(let value){
    this.y = value;
  }

  function moveUp(let yMove){
    let yOrigin = this.getY();
    setY(yOrigin - yMove);
  }

  function moveDown(let yMove){
    let yOrigin = this.getY();
    setY(yOrigin + yMove);
  }

  function moveLeft(let xMove){
    let xOrigin = this.getX();
    setX(xOrigin - xMove);
  }

  function moveRight(let xMove){
    let xOrigin = this.getX();
    setX(xOrigin + xMove);
  }

  function moveUpRight(let xMove, let yMove){
    let xOrigin = this.getX();
    let yOrigin = this.getY();
    setY(yOrigin - yMove);
    setX(xOrigin + xMove);
  }

  function moveDownRight(let xMove, let yMove){
    let xOrigin = this.getX();
    let yOrigin = this.getY();
    setY(yOrigin + yMove);
    setX(xOrigin + xMove);
  }

  function moveUpLeft(let xMove, let yMove){
    let xOrigin = this.getX();
    let yOrigin = this.getY();
    setY(yOrigin - yMove);
    setX(xOrigin - xMove);
  }

  function moveDownLeft(let xMove, let yMove){
    let xOrigin = this.getX();
    let yOrigin = this.getY();
    setY(yOrigin + yMove); 
    setX(xOrigin - xMove);
  }
