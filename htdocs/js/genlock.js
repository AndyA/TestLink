$(function() {
  var $players = $('video');
  var master = $players.get(0);
  var $master = $(master);

  function withOthers(self, cb) {
    $players.each(function() {
      if (this != self) {
        cb.apply(this);
      }
    });
  }

  $players.on('pause', function(ev) {
    withOthers(this, function() {
      console.log("pause: " + this);
      this.pause();
    });
  });

  $players.on('play', function(ev) {
    this.playbackRate = 1;
    withOthers(this, function() {
      console.log("play: " + this);
      this.play();
    });
  });

  $master.on('timeupdate', function(ev) {
    var targetTime;
    var nTimes = 0;

    $players.each(function() {
      targetTime = nTimes == 0 ? this.currentTime : targetTime + this.currentTime;
      nTimes++;
    });
    targetTime /= nTimes;
    console.log('targetTime=' + targetTime);

    $players.each(function() {
      var err = targetTime - this.currentTime;
      var aerr = Math.abs(err);
      if (aerr < 2) {
        var rate = aerr < 0.01 ? 1 : aerr < 1 ? 1.2 : aerr < 5 ? 2 : 10;
        this.playbackRate = err < 0 ? 1 / rate : rate;
      } else {
        this.currentTime = targetTime;
      }
      console.log('err=' + err + ', rate=' + this.playbackRate);
    });
  });

});
