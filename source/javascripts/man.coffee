





$('document').ready ->
	$('input.sub').click ->
		$('#main').append("<br><img class=load src=images/loading2.gif>")
		
		data=$('input.inp').val()
		get_j(data)
		





get_j=(x)->
	$('input.inp').html="koko"
	u='http://pipes.yahoo.com/pipes/pipe.run?_id=874eeb1dab3458f6c8f1d7f015e234e9&_render=json&textinput1='
	url=u+x
	$.getJSON(url,f)

	





f=(x) ->
	$('img.load').remove()
	r_mark=/\d+.\d+/
	r_num=/\d+/
	for a in x.value.items
		
		e_mark=r_mark.exec(a.mark.value)
		e_num=r_num.exec(a.num.value)
		mark=ba(e_mark,e_num)
		
		if a.biblio?
			e_bibl=a.biblio.value
			e_bibl=e_bibl.replace("Библиографическая ссылка:","","gi")
			alert(e_bibl)
		$('#main').append("<hr><div class='item'>"+e_bibl+"<p>"+"Рейтинг:"+mark+"</div>")



ba=(m,n) ->
	y=30.0
	a=n*m/(n+y)
	b=y*7.2453/(n+y)
	return a+b



