var mas_url_img_head = ["img/cader_from_firlm/cadr_from_film_03.jpg", "img/cader_from_firlm/cadr_from_film_09.png", "img/cader_from_firlm/cadr_from_film_12.png"];
var mas_url_img_prem = {
	'Name_Film': 'img/small_baner_film/small-baner-film_02.png',
	'Name_Film_3': 'img/small_baner_film/small-baner-film_03.png',
	'Name_Film_4': 'img/small_baner_film/small-baner-film_04.png',
	'Name_Film_5': 'img/small_baner_film/small-baner-film_05.png',
	'Name_Film_6': 'img/small_baner_film/small-baner-film_06.png',
	'Name_Film_7': 'img/small_baner_film/small-baner-film_07.jpg',
};
function bild_My() {
	if (jQuery) {
		bild_Head(mas_url_img_head);
		bild_TheFilm_Primer(mas_url_img_prem);
	}
}
function bild_Head(mas) {
	for (var i = 0; i < mas.length; i++) {
		$('.bxslider').append('<li><img src="' + mas[i] + '" /></li>');
	}
	for (var i = 0; i < mas.length; i++) {
		$('#bx-pager').append('<a data-slide-index="' + i + '" href=""><img src="' + mas[i] + '" /></a>');
	}
}
function bild_TheFilm_Primer(mas) {
	for (var i in mas_url_img_prem) {
		$('.bxslider_2').append('<li><img style="height: 250px;" src="' + mas_url_img_prem[i] + '"/><div id="neme_film_smal_baner"><a href="#">' + i + '</a></div></li>');
	}
}