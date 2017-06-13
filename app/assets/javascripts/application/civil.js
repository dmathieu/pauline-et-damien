jQuery(document).ready(function() {
  jQuery('.row.civil .picture').click(function(e) {
    var modal = $('#civilModal')
    var l = jQuery(e.target);

    if (jQuery(l).hasClass('picture')) {
      var p = l;
    } else {
      var p = jQuery(l.parents('.picture'));
    }

    modal.modal('hide');
    modal.find('.modal-body .picture').attr('src', p.attr('data-img'))
    modal.modal('show')

    e.stopPropagation()
    return false;
  });
});
