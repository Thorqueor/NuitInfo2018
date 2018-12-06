class Actor {
  constructor (x, y){
    if (this.constructor === Actor) {
      throw new TypeError ("Error");
    }
    this.x = x;
    this.y = y;
  }
  scroll () {
    this.x = this.x-5;
  }
}
