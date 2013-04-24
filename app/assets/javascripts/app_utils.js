var app = {
    

}

$(window).scroll(function(){
  var yLeftToGo = document.height - (window.pageYOffset + window.innerHeight); 
  if(yLeftToGo == 0){
    //pagination logic need to be implemented
    console.log('atbottom')
  } 
})

