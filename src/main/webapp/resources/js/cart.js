function increaseQuantity(btn){
	var quantity = parseInt(btn.form.q.value)
	btn.form.q.value = quantity + 1
}

function decreaseQuantity(btn){
	var quantity = parseInt(btn.form.q.value)
	
	if(quantity > 1)
		btn.form.q.value = quantity - 1
	else
		return
}

function onKeyPress(q, e) {
	if (e.keyCode == 13) {
        q.form.submit()
        return false
    } else
    	return true
}