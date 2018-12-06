class Controller{
  constructor(){
    this.grid = new Array(1000);
    for (var i = 0; i < this.grid.length; i++) {
      this.grid[i] = new Array(1000);
    }
    this.player = new Bird(10,10);
    //this.grid = new grid(args);
    this.obstacleList = [];
    this.objectivelist = [];
    this.droppackageList = [];
  }
    run = function(){
      this.first_init();
       while (true) {
         //Check control entry
         //if yes, bird.dothing(0)
         this.actualise();
         //scrolling happens
         this.actualise();


       }
    }

  function first_init(){
    let background = new Image();
    background.src = "lib/background.png";

  }
}
