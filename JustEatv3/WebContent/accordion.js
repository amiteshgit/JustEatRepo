/*jQuery(document).ready(function() {
	function close_accordion_section() {
		jQuery('.accordion .accordion-section-title').removeClass('active');
		jQuery('.accordion .accordion-section-content').slideUp(300).removeClass('open');

	}

	jQuery('.accordion-section-title').click(function(e) {
		// Grab current anchor value
		var currentAttrValue = jQuery(this).attr('href');
//alert('1--currentAttrValue='+currentAttrValue)
		if(jQuery(e.target).is('.active')) {
			close_accordion_section();
		}else {
			close_accordion_section();

			// Add active class to section title
			jQuery(this).addClass('active');
			// Open up the hidden content panel
			jQuery('.accordion ' + currentAttrValue).slideDown(300).addClass('open'); 
			alert(jQuery('.accordion ' + currentAttrValue));
		}

		e.preventDefault();
	});
});*/


function showHideAcc(id){
	
	if(document.getElementById(id).style.display=='none'){
		
//		document.getElementById(id).style.display='block';
		$('#'+id).show(300);
//		jQuery('.accordion .accordion-section-title').addClass('active');
//$(divId).slideToggle();
	}else if(document.getElementById(id).style.display=='block'){
//		document.getElementById(id).style.display='none';
//		jquery(id).slideUp(300).removeClass('open');
		$('#'+id).hide(300);
	}
	
	
}