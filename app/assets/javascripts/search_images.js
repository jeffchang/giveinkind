$(document).ready(function() {
  new Searchable('#search-image');
  new Submittable('#search-image');
});

function Searchable(container) {
  $(document).on('focusout', "#name-search", function() {
    var data = "term="+$("name-search").value;
    jQuery.post("/needed_items/images",
      data, function(response) {
        var images = "<h3>Select an image!</h3>";
        for (var i = 0; i < response.length; i++) {
          images += "<input type='radio' name='image' id='"+i+"' class='input-hidden' /><label for='"+i+"'><img src='"+response[i]+"' class='sample-images'></label>"
        }
        jQuery("#search-images").html(images);
    });
  });
}

function Submittable(container) {
  $(".submit-item").submit(function(e) {
    e.preventDefault();
    
  })
}