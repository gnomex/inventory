var Inventory = Inventory || {autorun: true};

$(function(){
  var app = new Inventory.Application(document.body);

  if (Inventory.autorun) {
    console.log("Inventory initialized!");
  }
});
