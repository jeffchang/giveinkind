var plate_url, url;

$(document).ready(function(){
  new EmbedNeededItem("#build_need");
});

function EmbedNeededItem(container) {
  jQuery("#create-button").on("click", function(e) {
    e.preventDefault();
    jQuery("#dialog-form").dialog("open");
  });

  jQuery("#dialog-form").dialog({
    dialogClass: "no-close",
    autoOpen: false,
    height: 825,
    width: 800,
    modal: true,
    buttons: {
    }
  });
};