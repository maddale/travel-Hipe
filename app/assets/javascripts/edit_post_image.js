var image
var originalWidth, originalHeight, newWidth, newHeight;

function PhotoPickUp (event, url) {
  event.preventDefault();
  image = document.createElement('img');
  image.src = url;
  image.id = 'cropbox';
  

  $('#selected-photo').append(image);  

  $(image).ready(function() {
    $('#apply-crop').fadeIn(300);
    originalWidth = image.naturalWidth;
    originalHeight = image.naturalHeight;
    newWidth = image.width;
    newHeight = image.height;
    console.log (originalWidth + ' ' + originalHeight + ' ' + newWidth + ' ' + newHeight);
  });

  $('#cropbox').Jcrop({
    setSelect: [0, 0, 745, 250],
    aspectRatio: 745/250,
    onSelect: updateCoords,
    onChange: updateCoords,
  });


  function updateCoords(coords) {
    $('#coord_x').val(coords.x);
    $('#coord_y').val(coords.y);
    $('#coord_w').val(coords.w);
    $('#coord_h').val(coords.h);
  }

}

  function applyCrop() {
    image.id = 'picked-image'
    var viewWidth = $('.post-title-edit').width();
    var viewHeight = $('.post-title-edit').height();
    var lastWidth = (viewWidth / (newWidth - $('#coord_w').val() + $('#coord_x').val())) * newWidth;
    var aspectRatio = newHeight / newWidth;
    var lastHeight = lastWidth * aspectRatio;

    console.log ('viewWidth = ' + viewWidth);
    console.log ('viewHeight = ' + viewHeight);
    console.log ('newWidth = ' + newWidth);
    console.log ('newHeight = ' + newHeight);
    console.log ('coored x = ' + $('#coord_x').val());
    console.log ('coord w = ' + $('#coord_w').val());
    console.log ('last width = ' + lastWidth);


    $('.post-title-edit').append(image);  
    $('#popup-1').detach();  
    $('#picked-image').css("width", lastWidth);
    $('#picked-image').css("height", lastHeight);
    $('#picked-image').css("top", ($('#coord_y').val() / newHeight) * lastHeight * -1);
    $('#picked-image').css("left", ($('#coord_x').val() / newWidth) * lastWidth * -1);
    $('#picked-image').css("display", "block");
    $('#picked-image').css("visibility", "unset");

  }