function PhotoPickUp (event, url) {
  event.preventDefault();
  var image = loadImage(url, function(img){
    loadImage.scale(img, {
          left: 0,
          top: 0,
          sourceWidth: 700,
          sourceHeight: 200,
          minWidth: 700,
          maxWidth: 700,
          pixelRatio: 700/200,
          downsamplingRatio: 0.5
        });

  });
  
  image.id = 'cropbox';

 







  $('#selected-photo').append(image);  

  // var image = document.createElement('img');
  
  // image.src = url;
  // 
  // $('#cropbox').Jcrop({
  //   setSelect: [0, 0, 745, 250],
  //   aspectRatio: 745/250
  // });
}