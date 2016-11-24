jQuery(document).ready(function() {
  var target_date = new Date('Sat Aug 05 2017 14:00:00 GMT+0200').getTime();
  var days, hours, minutes, seconds;

  var countdown      = jQuery('.countdown');
  var day_element    = countdown.find('.days .value')
  var hour_element   = countdown.find('.hours .value')
  var minute_element = countdown.find('.minutes .value')
  var second_element = countdown.find('.seconds .value')

  setInterval(function () {
    var current_date = new Date().getTime();
    var seconds_left = (target_date - current_date) / 1000;

    days = parseInt(seconds_left / 86400);
    seconds_left = seconds_left % 86400;

    if (day_element.text() != days) {
      day_element.text(days);
    }

    hours = parseInt(seconds_left / 3600);
    seconds_left = seconds_left % 3600;
    if (hour_element.text() != hours) {
      hour_element.text(hours);
    }

    minutes = parseInt(seconds_left / 60);
    seconds = parseInt(seconds_left % 60);
    if (minute_element.text() != minutes) {
      minute_element.text(minutes);
    }
    second_element.text(seconds);
  }, 1000);
});
