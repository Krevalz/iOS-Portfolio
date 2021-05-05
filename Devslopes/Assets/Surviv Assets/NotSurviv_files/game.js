class Vector {
    constructor(x = 0, y = 0) {
        this.x = x;
        this.y = y;
    }

    static ADD(v1, v2) {
        return new Vector(
            v1.x + v2.x, 
            v1.y + v2.y
        );
    }

    static SUBTRACT(v1, v2) {
        return new Vector(
            v1.x - v2.x, 
            v1.y - v2.y
        );
    }

    static SCALE(v, s) {
        return new Vector(
            v.x * s,
            v.y * s,
        );
    }

    static LENGTH(v) {
        return Math.sqrt(v.x * v.x + v.y * v.y);
    }

    static NORMALIZE(v) {
        let length = Vector.LENGTH(v);
        if (length != 0) {
            return new Vector(v.x / length, v.y / length);
        } else {
            return new Vector();
        }
    }

    static ROTATE(v, angle) {
        const cos = Math.cos(angle);
        const sin = Math.sin(angle);
        return new Vector(
            cos * v.x - sin * v.y,
            sin * v.x + cos * v.y
        );
    }
}

class BoxEntity {
    constructor (x, y, width, height) {
        this.position = new Vector(x,y);
        this.width = width;
        this.height = height;
    }

    get x() { return this.position.x }
    get y() { return this.position.y }

    get halfWidth()  { return this.width  / 2 }
    get halfHeight() { return this.height / 2 }

    get top()   { return this.position.y; }
    get right() { return this.position.x + this.width - 1; }
    get bottom(){ return this.position.y + this.height - 1;}
    get left()  { return this.position.x; }

    set x(val) { this.position.x = val }
    set y(val) { this.position.y = val }

    set top(val)    { this.position.y = val; }
    set right(val)  { this.position.x = val - this.width + 1; }
    set bottom(val) { this.position.y = val - this.height + 1; }
    set left(val)   { this.position.x = val; }

    get midPoint() {
        let x = this.position.x + this.halfWidth;
        let y = this.position.y + this.halfHeight;
        return new Vector(x, y);
    }

    set midPoint(v) {
        this.position.x = v.x - this.halfWidth;
        this.position.y = v.y - this.halfHeight;
    }
}

class BoxCollider {
    constructor() {}

    // Checks if box1 and box2 overlap
    static COLLIDES(b1, b2) {
        return !(b1.top > b2.bottom || b1.right < b2.left || b1.bottom < b2.top || b1.left > b2.right);
    }

    /// Checks if box2 is completely inside box1
    static CONTAINS(b1, b2) {
        return (b1.top <= b2.top && b1.right >= b2.right && b1.bottom >= b2.bottom && b1.left <= b2.left); 
    }
}

class PhysicsEntity extends BoxEntity {
    constructor(x, y, width, height, mass = 1, restitution = 1, constrainToWorld = true) {
        super(x, y, width, height);

        this.acceleration = new Vector();
        this.velocity = new Vector();
        this.angle = 0;
        this.mass = mass || 1;
        this.restitution = restitution;
        this.constrainToWorld = constrainToWorld;
        this.phyisicsType = PhysicsEntity.DYNAMIC; 
    }

    applyForce(v) {
        this.acceleration.x += v.x / this.mass;
        this.acceleration.y += v.y / this.mass;
    }

    update(dt) {
        this.velocity.x += this.acceleration.x;
        this.velocity.y += this.acceleration.y;

        this.position.x += this.velocity.x * dt;
        this.position.y += this.velocity.y * dt;

        this.acceleration.x = 0;
        this.acceleration.y = 0;

        if (Math.abs(this.velocity.x) < 1) {
            this.velocity.x = 0;
        }
        if (Math.abs(this.velocity.y) < 1) {
            this.velocity.y = 0;
        }
    }
}

class Game {
    constructor(options) {
        const width = options.width || 500;
        const height = options.height || 500;
        this.borders = new BoxEntity(0, 0, width, height);
        this.entities = options.entities || [];
    }

    update(dt) {
        let i = 0;
        const length = this.entities.length;

        for (i = 0, length; i < length; i++) {
            let e = this.entities[i];
            e.update(dt);
        } 
    }
}