class Player {
    constructor() {
        this.x = 0;
        this.y = 0;
        this.angle = 0;
        this.r = 25;

        const colors = ["#cfffbd", "#9ed8ff", "#beb8ff", "#ff9ebb", "#ffce9e", "#ffe2cc", "#fefeff", "#bcc8cc"];
        this.color = colors[Math.floor(Math.random() * colors.length)];
        this.stroke = "black";
        this.it = false;

        this.tagReady = 0;
        this.coolDown = 50;

        this.name = "guest";
    }

    update(dt, controller, PLAYAREA) {
        let speed = 400 * dt;
        if (this.it) {
            speed = 430 * dt;
        }


        if (controller.pressed(KEY.W)) 
            this.y -= speed;
        if (controller.pressed(KEY.A)) 
            this.x -= speed;
        if (controller.pressed(KEY.S)) 
            this.y += speed;
        if (controller.pressed(KEY.D)) 
            this.x += speed;

        PLAYAREA = PLAYAREA / 2;
        

        if (this.x < -PLAYAREA) {
            this.x = -PLAYAREA;
        }
        if (this.x > PLAYAREA) {
            this.x = PLAYAREA;
        }
    
        if (this.y < -PLAYAREA) {
            this.y = -PLAYAREA;
        }
        if (this.y > PLAYAREA) {
            this.y = PLAYAREA;
        }
    
        let delta_x = controller.mouseCoordinate.x - display.halfWidth;
        let delta_y = controller.mouseCoordinate.y - display.halfHeight;
        this.angle = Math.atan2(delta_y, delta_x) + Math.PI / 2;
    }

    static render2(display, player, showName = true) {
        let bodyColor, handColor, eyeColor;

        if (player.it) {
            bodyColor = "#202028";
            handColor = "#ffa049";
            eyeColor = "#552000";
        } else {
            bodyColor = player.color;
            handColor = player.color;      
            eyeColor = "black";  
        }


        display.save();

        display.translate(player.x, player.y);
        display.save();

        display.rotate(player.angle);


        display.fillCircle(-20, -20, 10, handColor);
        display.strokeCircle(-20, -20, 10, "black");


        display.fillCircle(20, -20, 10, handColor);
        display.strokeCircle(20, -20, 10, "black");

        display.fillCircle(0, 0, 25, bodyColor);
        display.strokeCircle(0, 0, 25, "black");

        display.fillCircle(-5, -15, 2, eyeColor);
        display.fillCircle(5, -15, 2, eyeColor);
        display.restore();

        if (showName) {
            // Measure size of text
            let metrics = display.measureText(player.name);
            display.fillText(player.name, -metrics.width/2, 30, "#aaaabb");
        }
        display.restore();
    }

    render(display) { Player.render2(display, this, false); }

    tag() {
        this.it = true;
        this.tagReady = this.coolDown;
    }
}