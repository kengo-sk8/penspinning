$(window).load(function() {
  var video = document.getElementById('main_show_video_preview');
  var prevFrame = document.getElementById('prev-frame');
  var nextFrame = document.getElementById('next-frame');
  var frameRate = 1/30;

  video.onloadedmetadata = function(){
    //next
    nextFrame.addEventListener('click',function(){
        console.log('pushed next');
        video.currentTime = Math.min(video.duration, video.currentTime+frameRate);
    });

    //prev
    prevFrame.addEventListener('click',function(){
        console.log('pushed prev');
        video.currentTime = Math.max(0, video.currentTime-frameRate);
    });
  }
});
