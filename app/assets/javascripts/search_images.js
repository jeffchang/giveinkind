$(document).ready(function() {
  new Searchable('#search-image');
  new Blockable('#infinite-scroll');
});

function Searchable(container) {
  $(document).on('focusout', "#name-search", function() {
    var data = "term="+$("name-search").value;
    jQuery.post("/needed_items/images",
      data, function(response) {
        var images = "<h3>Select an image!</h3>";
        for (var i = 0; i < response.length; i++) {
          images += "<input type='radio' name='image_url' id='"+i+"' class='input-hidden' value='"+response[i]+"' /><label for='"+i+"'><img src='"+response[i]+"' class='sample-images'></label>"
        }
        jQuery("#search-images").html(images);
    });
  });
}

function Blockable(container) {
  jQuery('.story-image').each(function() {
    if ($(this).height() > $(this).width()) {
        $(this).css('min-width', $(this).height());
    } else {
        $(this).css('min-height', $(this).width());
    }
  });
}