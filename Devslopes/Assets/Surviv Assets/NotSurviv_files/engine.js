class Engine {
    constructor(options) {
        this.now = 0;
        this.dt = 0;
        this.last = this.timestamp();
        this.slow = options.slow || 1;
        this.step = 1/options.fps;
        this.slowStep = this.slow * this.step;
        this.update = options.update;
        this.render = options.render;

        this.runtime = 0;

        requestAnimationFrame(this.frame.bind(this));
    }

    frame() {
      this.now = this.timestamp();
      this.runtime += (this.now - this.last) / 1000;
      this.dt = this.dt + Math.min(1, (this.now - this.last) / 1000);
      while(this.dt > this.slowStep) {
        this.dt = this.dt - this.slowStep;
        update(this.step, this.runtime);
      }
      render(this.dt/this.slow, this.runtime);
      this.last =this.now;
      requestAnimationFrame(this.frame.bind(this));
    }

    timestamp() {
        return window.performance && window.performance.now ? window.performance.now() : new Date().getTime();
    }
}