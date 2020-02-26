	cat();
	brand();
  product();
  page();
	//cat() is a funtion fetching category record from database whenever page is load
	function cat(){
		$.ajax({
			url	:	"functions.php",
			method:	"POST",
			data	:	{category:1},
			success	:	function(data){
				$("#get_category").html(data);

			}
		})
	}

	//cat() is a funtion fetching category record from database whenever page is load
	function brand(){
		$.ajax({
			url	:	"functions.php",
			method:	"POST",
			data	:	{brand:1},
			success	:	function(data){
				$("#get_brand").html(data);

			}
		})
	}

  //product() is a funtion fetching product record from database whenever page is load
		function product(){
		$.ajax({
			url	:	"functions.php",
			method:	"POST",
			data	:	{getProduct:1},
			success	:	function(data){
				$("#get_product").html(data);
			}
		})
	}
	/*	when page is load successfully then there is a list of categories when user click on category we will get category id and
		according to id we will show products
	*/
	$("body").delegate(".category", "click", function(event){
		$("#get_product").html("<h3>Loading.....</h3>");
		event.preventDefault();
		var cid = $(this).attr('cid');

		$.ajax({
			url : "functions.php",
			method : "POST",
			data : {get_selected_category:1, cat_id:cid},
			success : function(data){
				$("#get_product").html(data);
			}
		})
	})

	/*	when page is load successfully then there is a list of brands when user click on brand we will get brand id and
		according to brand id we will show products
	*/
	$("body").delegate(".selectBrand","click",function(event){
		event.preventDefault();
		$("#get_product").html("<h3>Loading...</h3>");
		var bid = $(this).attr('bid');

			$.ajax({
			url		:	"functions.php",
			method	:	"POST",
			data	:	{selectBrand:1,brand_id:bid},
			success	:	function(data){
				$("#get_product").html(data);
			}
		})

	})

	/*
		At the top of page there is a search box with search button when user put name of product then we will take the user
		given string and with the help of sql query we will match user given string to our database keywords column then matched product
		we will show
	*/
	$("#search_btn").click(function(){
		$("#get_product").html("<h3>Loading...</h3>");
		var keyword = $("#search").val();
		if(keyword != ""){
			$.ajax({
			url		:	"functions.php",
			method	:	"POST",
			data	:	{search:1,keyword:keyword},
			success	:	function(data){
				$("#get_product").html(data);
			}
		})
		}
	})



  //page() is a funtion fetching product record from database whenever page is load
		function page(){
		$.ajax({
			url	:	"functions.php",
			method:	"POST",
			data	:	{page:1},
			success	:	function(data){
				$("#get_pagination").html(data);
			}
		})
	}





function triggerClick(e) {
	document.querySelector('#productImage').click();
}
function displayImage(e) {
	if (e.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e){
			document.querySelector('#profileDisplay').setAttribute('src', e.target.result);
		}
		reader.readAsDataURL(e.files[0]);
	}
}

//Active menu
$('#get_category').on('click','ul li a',function(){
$('#get_category ul li a.active').removeClass('active');
$(this).addClass('active');
});



$('#get_brand').on('click','a',function(){
$('#get_brand a.active').removeClass('active');
$(this).addClass('active');
});
