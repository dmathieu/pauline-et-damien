jQuery(document).ready(function() {
  jQuery('.gifts .entry').click(function(e) {
    var modal = $('#giftsModal')
    var l = jQuery(e.target);
    var p = jQuery(l.parents('.entry'));

    modal.modal('hide');

    if (!p.hasClass('finished')) {
      modal.find('.modal-title').html(p.attr('data-title'))
      modal.find('.modal-body .payment_id').val(p.attr('data-id'))
      modal.find('.modal-body .description').html(p.attr('data-title'))
      modal.find('.modal-body .price').html(p.attr('data-price') + '&euro;')
      modal.find('.modal-body .remaining').html(p.attr('data-remaining') + '&euro;')
      modal.find('.modal-body .photo').attr('src', p.attr('data-photo'))

      modal.modal('show')
    }

    e.stopPropagation()
    return false;
  });
});
