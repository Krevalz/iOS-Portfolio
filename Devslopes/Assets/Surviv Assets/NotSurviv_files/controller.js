// Joshua Ramos
// 12/26/18

const KEY = {
    BACKSPACE: 8,
    TAB:       9,
    RETURN:   13,
    SHIFT:    16,
    ESC:      27,
    SPACE:    32,
    PAGEUP:   33,
    PAGEDOWN: 34,
    END:      35,
    HOME:     36,
    LEFT:     37,
    UP:       38,
    RIGHT:    39,
    DOWN:     40,
    INSERT:   45,
    DELETE:   46,
    ZERO:     48, ONE: 49, TWO: 50, THREE: 51, FOUR: 52, FIVE: 53, SIX: 54, SEVEN: 55, EIGHT: 56, NINE: 57,
    A:        65, B: 66, C: 67, D: 68, E: 69, F: 70, G: 71, H: 72, I: 73, J: 74, K: 75, L: 76, M: 77, N: 78, O: 79, P: 80, Q: 81, R: 82, S: 83, T: 84, U: 85, V: 86, W: 87, X: 88, Y: 89, Z: 90,
    TILDA:    192
};

class Controller {
    constructor(keys = [], useDefaultKeys = true) {
        this.keys = keys;
        if (useDefaultKeys) {
            this.keys = [...this.keys, ...[KEY.UP, KEY.RIGHT, KEY.DOWN, KEY.LEFT, KEY.SPACE, KEY.W, KEY.A, KEY.S, KEY.D, KEY.SHIFT]];
        }

        // Maps each key to a object {keyCode, isPressed}
        this.keys = this.keys.map(key=>{return {keyCode: key, isPressed: false}});
        this.mouseCoordinate = {x: 0, y: 0};

        document.addEventListener('keydown', function(ev) { return this.onKey(ev, ev.keyCode, true);  }.bind(this), false);
        document.addEventListener('keyup',   function(ev) { return this.onKey(ev, ev.keyCode, false); }.bind(this), false);
        document.addEventListener('mousemove', function(ev) { return this.mouseMove(ev) }.bind(this), false);

    }

    pressed(keyCode) {
        for (let i = 0, length = this.keys.length; i < length; i++) {
            if (this.keys[i].keyCode == keyCode) {
                return this.keys[i].pressed;
            }
        } 
        // Defaults to false if asking for a key that the controller doesn't track
        return false;
    }

    onKey(ev, keyCode, pressed) {
        this.keys.forEach((key, i) => {
            if (key.keyCode == keyCode) {
                this.keys[i].pressed = pressed;
                // ev.preventDefault();
            } 
        })
    }

    mouseMove(ev) {
        this.mouseCoordinate = {x: ev.clientX, y: ev.clientY};
    }
}