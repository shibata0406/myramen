$(window).on("load", function() {
  $(".tab-menu li").on("click", function() {
    $("li.selected").removeClass("selected");
    $(this).addClass("selected");
    $(".left").hide();
    $(".right").hide();
    $("." + this.id).fadeIn(300).show();
  });
});