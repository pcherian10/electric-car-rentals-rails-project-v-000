
$(function () {
  $(".js-next").on("click", function() {
    var nextId = parseInt($(".js-next").attr("data-id")) + 1;
    $.get("/cars/" + nextId + ".json", function(data) {
      var car = data;
      $(".carName").text(car["name"]);
      $(".js-next").attr("data-id", car["id"]);
    });
  });
});


$(function () {
  $(".js-previous").on("click", function() {
    var previousId = parseInt($(".js-next").attr("data-id")) - 1;
    debugger;
    $.get("/cars/" + previousId + ".json", function(data) {
      var car = data;
      $(".carName").text(car["name"]);
      $(".js-previous").attr("data-id", car["id"]);
    });
  });
});
