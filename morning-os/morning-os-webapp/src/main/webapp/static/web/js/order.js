$(function() {
	$('#J_showDetail').on("click", function() {
		$('#J_postInfo').toggleClass('post-info-hide');
		if ($('#J_postInfo').hasClass('post-info-hide')) {
			$('.order-detail').css('display', 'block');
		} else {
			$('.order-detail').css('display', 'none');
		}
	})
})