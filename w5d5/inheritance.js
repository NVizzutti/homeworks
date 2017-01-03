class Bicycle {
  constructor(color, model) {
    this.color = color;
    this.model = model;
  }

  action() {
    return "rolls along";
  }
}

class RaceBicycle extends Bicycle {
  constructor(color, model, gears) {
    super(color, model);
    this.gears = gears;
  }

  action() {
    const oldAction = super.action();
    return `${oldAction} at a blistering pace!`;
  }
}
