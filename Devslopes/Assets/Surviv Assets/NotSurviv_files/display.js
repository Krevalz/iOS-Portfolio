class Display {
    constructor(width = window.innerWidth, height = window.innerHeight) {
        // Setup Main Canvas
        this.canvas = document.createElement("canvas");
        this.canvas.height = height;
        this.canvas.width = width;
        this.context = this.canvas.getContext("2d");

        // Setup Buffer Canvas
        this.buffer = document.createElement("canvas").getContext("2d");
        this.buffer.canvas.height = this.canvas.height;
        this.buffer.canvas.width = this.canvas.width;

        // Variables
        this.height_width_ratio = this.canvas.height / this.canvas.width;
        this.defaultColor = "black";
        this.defaultLineWidth = 2;

        this.shiftColor = [0, 0, 0];
        this.shiftDirection = [-1, -1, -1];

        document.body.insertBefore(this.canvas, document.body.firstChild);
    }

    // Getters for the main canvas's dimensions
    get height() { return this.canvas.height; }
    get width() { return this.canvas.width; }
    get halfHeight() { return this.height / 2; }
    get halfWidth() { return this.width / 2; }

    colorShift() {
        for(let i = 0; i < 3; i++) {
            let color = this.shiftColor[i];
            let shift = this.shiftDirection[i];

            if (color + shift > 255 || color + shift < 0) {
                shift = shift < 0 ? Math.random() * 1 + 0.5 : Math.random() * -1 - 0.5;
            }

            color += shift;

            this.shiftColor[i] = color;
            this.shiftDirection[i] = shift;
        }
        return "rgb(" + this.shiftColor[0] + "," + this.shiftColor[1] + "," + this.shiftColor[2] + ")";

    }

    // Fills entire canvas with a solid color
    clear(color) {
        this.buffer.fillStyle = color || this.defaultColor;
        this.buffer.fillRect(0,0,this.canvas.width,this.canvas.height);
    }

    drawLine(x1,y1,x2,y2,color,lineWidth) {
        this.buffer.lineWidth = lineWidth || this.defaultLineWidth;
        this.buffer.strokeStyle = color || this.defaultColor;
        this.buffer.beginPath();
        this.buffer.moveTo(x1, y1);
        this.buffer.lineTo(x2, y2);
        this.buffer.closePath();
        this.buffer.stroke();
    }

    fillRect(x,y,width,height,color) {
        this.buffer.fillStyle = color || this.defaultColor;
        this.buffer.fillRect(x,y,width,height);
    }

    strokeRect(x,y,width,height,color,lineWidth) {
        this.buffer.lineWidth = lineWidth || this.defaultLineWidth;
        this.buffer.strokeStyle = color || this.defaultColor;
        this.buffer.strokeRect(x,y,width,height);
    }

    fillCircle(x,y,radius,color) {
        this.buffer.fillStyle = color || this.defaultColor;
        this.buffer.beginPath();
        this.buffer.arc(x, y, radius, 0, Math.PI * 2, true);
        this.buffer.closePath();
        this.buffer.fill();
    }

    strokeCircle(x,y,radius,color,lineWidth) {
        this.buffer.lineWidth = lineWidth || this.defaultLineWidth;
        this.buffer.strokeStyle = color || this.defaultColor;
        this.buffer.beginPath();
        this.buffer.arc(x,y,radius,0,Math.PI * 2, true);
        this.buffer.closePath();
        this.buffer.stroke();
    }
    
    fillText(text, x, y, color = this.defaultColor, font = "30px Arial") {
        this.buffer.font = font;
        this.buffer.fillStyle = color;
        this.buffer.textBaseline = "top";
        this.buffer.fillText(text, x, y);
    }

    translate(x, y) {
        this.buffer.translate(x, y);
    }

    rotate(angle) {
        this.buffer.rotate(angle);
    }

    scale(x, y) {
        this.buffer.scale(x, y);
    }
 
    save() {
        this.buffer.save();
    }

    restore() {
        this.buffer.restore();
    }

    drawImage(image,x,y,width,height) {
        this.buffer.drawImage(image, x, y, width, height);
    }

    drawImage(image,x,y) {
        this.buffer.drawImage(image, x, y);
    }

    // Returns a random color in hex -- eg. "#FE3BC6"
    randomColor() {
        return  "#"+((1<<24)*Math.random()|0).toString(16)
    }

    // drawGrid(rows, columns, color) {
    //     const rowHeight = this.height / rows;
    //     const columnWidth = this.width / columns;
    
    //     for (let i = 1, x = 0; i < columns; i++) {
    //         x += columnWidth;
    //         this.drawLine(x,0,x,this.height,color);
    //     }

    //     for (let i = 1, y = 0; i < rows; i++) {
    //         y += rowHeight;
    //         this.drawLine(0,y,this.width,y,color);
    //     }
    // }

    drawGrid(areaSize, cellSize,color) {
        let halfArea = areaSize/2;
        
        for (let i = 0; i <= areaSize; i += cellSize) {
            this.drawLine(-halfArea+i,-halfArea,-halfArea+i,halfArea,color);
            this.drawLine(-halfArea,-halfArea+i,halfArea,-halfArea+i,color);
        }
    }

    measureText(str, font = "30px Arial") {
        this.buffer.font = font;
        return this.buffer.measureText(str);
    }


    // Draws buffer canvas onto main canvas
    render() { 
        this.context.drawImage(this.buffer.canvas, 0, 0, this.buffer.canvas.width, this.buffer.canvas.height, 0, 0, this.context.canvas.width, this.context.canvas.height); 
    }
}