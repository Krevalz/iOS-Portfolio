// import { isContext } from "vm";

// import { read } from "fs";

// Keep track of our socket connection
const socket = io.connect('http://192.168.0.8:3000');

// Setup Engine
// const controller = new Controller([KEY.RETURN, KEY.ESC]);
// const display = new Display();
// const engine = new Engine({update: update, render: render, fps: 60});

// Game Variables
let movement = {
    up: false,
    down: false,
    left: false, 
    right: false
}
document.addEventListener('keydown', function(event) {
    switch (event.keyCode) {
      case 65: // A
        movement.left = true;
        break;
      case 87: // W
        movement.up = true;
        break;
      case 68: // D
        movement.right = true;
        break;
      case 83: // S
        movement.down = true;
        break;
    }
  });
  document.addEventListener('keyup', function(event) {
    switch (event.keyCode) {
      case 65: // A
        movement.left = false;
        break;
      case 87: // W
        movement.up = false;
        break;
      case 68: // D
        movement.right = false;
        break;
      case 83: // S
        movement.down = false;
        break;
    }
  });

socket.emit('new player');
setInterval(function() {
    socket.emit('movement', movement);
}, 1000 / 60);

const display = new Display();
socket.on('state', function(players) {

    let player = players[socket.id];
    if (player) {
        display.clear("#202028");
        display.save();
        display.translate(display.halfWidth-player.x, display.halfHeight-player.y);
        display.drawGrid(5000,100,"black");
    
        display.fillCircle(player.x, player.y, 25, "white");
        display.strokeCircle(player.x, player.y, 25, "black")
        display.restore();
    
        display.render();
    
    }

});