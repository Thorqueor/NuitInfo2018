class Droppack {
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

  function getY(){
    return y;
  }

  function droppackHitbox(Droppack droppack){
    let height = droppack.getHeight();
    let width = droppack.getWidth();
    let area = height*width;
    return area
  }

}
