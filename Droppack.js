class Droppack {
  constructor(x, y) {
    let sprite = getImage("creatures/Hopper-Happy");;
    let height = sprite.height;
    let width = sprite.width;
    let gravityFactor = 3; //valeur arbitraire liée à la gravité
    let kineticFactor = 1; //selon le principe d'inertie de Newton, l'objet largué subira un mouvement vers l'avant qui sera atténué par les frottements de l'air
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


  function droppackHitbox(){
    let height = this.getHeight();
    let width = this.getWidth();
    let area = height*width;
    return area
  }

  function droppackFall(){
    let xOrigin = this.getX();
    let yOrigin = this.getY();
    setX(xOrigin + kineticFactor);
    setY(yOrigin + gravityFactor);
  }

}
