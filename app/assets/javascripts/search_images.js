$(document).ready(function() {
  new Searchable('#search-image');
});

function Searchable(container) {
  $(document).on('focusout', "#name-search", function() {
    var data = "term="+$("name-search").value;
    jQuery.post("/needed_items/images",
      data, function(response) {
        var images = "";
        for (var i = 0; i < response.length; i++) {
          images += "<h3>Select an image!</h3><input type='radio' name='image' id='"+i+"' class='input-hidden' /><label for='"+i+"'><img src='"+response[i]+"' class='sample-images'></label>"
        }
        jQuery("#search-images").html(images);
    });
  });
}