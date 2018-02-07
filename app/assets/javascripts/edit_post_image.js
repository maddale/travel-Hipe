function PhotoPickUp (event, url) {
  event.preventDefault();
  var image = document.createElement('img');
  image.src = url;
  image.id = 'cropbox';
  var originalWidth, originalHeight, newWidth, newHeight;

  $('#selected-photo').append(image);  

  $(image).ready(function() {
    $('#apply-crop').fadeIn(300);
    originalWidth = image.naturalWidth;
    originalHeight = image.naturalHeight;
    newWidth = image.width;
    newHeight = image.height;
  });

  $('#cropbox').Jcrop({
    setSelect: [0, 0, 745, 250],
    aspectRatio: 745/250,
    onSelect: updateCoords,
    onChange: updateCoords,
  });


  function updateCoords(coords) {
    $('#coord_x').val((coords.x / newWidth) * originalWidth);
    $('#coord_y').val((coords.y / newHeight) * originalHeight);
    $('#coord_w').val((coords.w / newWidth) * originalWidth);
    $('#coord_h').val((coords.h / newHeight) * originalHeight);
  }

  function applyCrop() {
    
    $('#selected-photo').append(image);  
    $('#popup-content-1').fadeOut(300);  
  }

}