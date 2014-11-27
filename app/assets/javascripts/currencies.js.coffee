# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->

$('select#select_country').select2();

canvas = new fabric.Canvas('c')
canvas.setHeight(400);
canvas.setWidth(1000);

# create a rectangle object

repoFormatResult = (repo) ->
      markup = '<div class="row-fluid">' +
         '<div class="span2"><img src="' + repo.owner.avatar_url + '" /></div>' +
         '<div class="span10">' +
            '<div class="row-fluid">' +
               '<div class="span6">' + repo.full_name + '</div>' +
               '<div class="span3"><i class="fa fa-code-fork"></i> ' + repo.forks_count + '</div>' +
               '<div class="span3"><i class="fa fa-star"></i> ' + repo.stargazers_count + '</div>' +
            '</div>'

      if (repo.description)
         markup += '<div>' + repo.description + '</div>'

      markup += '</div></div>'

      return markup

   repoFormatSelection = (repo) ->
      return repo.full_name

cat_pic = 'http://41.media.tumblr.com/67100e70f1b511394b1523670bed5d6b/tumblr_nf7nhhJBtP1qgn992o1_1280.jpg'

fabric.Image.fromURL cat_pic, (img) ->

	img.scale(0.4).set
		left: 100
		top: 100
		angle: -15

	canvas.add(img).setActiveObject(img)

$('#add_shape').bind 'click', (event) ->
	rect = new fabric.Rect
	  left: 100,
	  top: 100,
	  fill: 'red',
	  width: 20,
	  height: 20

	shape = 'http://fabricjs.com/assets/15.svg'
	canvas.add(rect)
	rect.set('fill', 'red');
	rect.set({ strokeWidth: 5, stroke: 'rgba(100,200,200,0.5)' });
	rect.set('angle', 15).set('flipY', true);


$("#e7").select2
    placeholder: "Search for a repository"
    minimumInputLength: 3
    ajax: 
        url: "https://api.github.com/search/repositories"
        dataType: 'json'
        quietMillis: 250
        data: (term, page) ->
            q: term
            page: page

        results: (data, page) -> 
            more = (page * 30) < data.total_count
            return { results: data.items, more: more }

    formatResult: repoFormatResult
    formatSelection: repoFormatSelection
    dropdownCssClass: "bigdrop"
    escapeMarkup: (m) -> 
    	return m





