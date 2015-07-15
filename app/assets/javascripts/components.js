Inventory.Application = (function(){
  function Application(container) {
    this.container = $(container);
  }

  Application.fn = Application.prototype;

  return Application;
})();
