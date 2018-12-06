class Bird extends Actor{
  constructor(x,y) {
    var sprite = new Image();
    sprite.src = "creatures/Hopper-Happy";
    var heigth = sprite.heigth;
    var width = sprite.width;
    super(x,y);
    dead = false;
  }
}

function getCoordonnees(){
  return x,y;
}

function getHitbox(){
  return heigth*width;
}

function up(){
  if (keyIsPressed && keyCode === 38) {
        y=y+5;
    }
}

function down(){
  if (keyIsPressed && keyCode === 40) {
        y=y-5;
    }
}

function left(){
  if (keyIsPressed && keyCode === 37) {
        x=x-5;
    }
}

function right(){
  if (keyIsPressed && keyCode === 39) {
        x=x+5;
    }
}

let myzozio = new Bird(10,10);
