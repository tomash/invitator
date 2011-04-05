// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(function() {
  
  $("#new_invitation").overlay({
    effect: 'apple',
    onBeforeLoad: function() {
      var wrap = this.getOverlay().find(".contentWrap");
      wrap.load(this.getTrigger().attr("href") + '.js');
    }
  });
  
});