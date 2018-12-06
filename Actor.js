class Actor {
  constructor (x, y){
    if (this.constructor === Actor) {
      throw new TypeError ("Error");
    }
    this.x = x;
    this.y = y;
  }
  scroll (y) {
    this.scroll = -5;
  }
}
