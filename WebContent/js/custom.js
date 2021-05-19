$(document).ready(function(){
  	var masanpham = 0;
	
	$("#cot1").click(function(){
		alert("hello");
	});
	
	$("#valiDangnhap").validate({
		rules:{
			email: "required",//k đc trống
			matkhau: "required",
		},
		messages:{
			email: "Vui lòng nhập email đăng nhập",
			matkhau:"Vui lòng nhập mật khẩu",
		},
		submitHandler: function(form){
			var email = $("#email").val()
			var matkhau = $("#matkhau").val()
			
			$.ajax({
				
				url:"http://localhost:8080/LOWJISHOP/api/KiemTraDangNhap",
				type:"GET",
				data:{
					email:email,
					matkhau:matkhau
				},
				success : function(value){
					if(value == "true"){
						
						duongdanhientai= window.location.href;
						duongdan=duongdanhientai.replace("dangnhap/","thongke/");
						window.location= duongdan;
						
						$("#ketqua").text(duongdan);
						
					}else{
						$("#ketqua").text("ĐĂNG NHẬP THẤT BẠI")
					}
				}
			});
			return false;
		}
	});

	$(".giohang").click(function(){ //nút giỏ hàng
		var machitiet = $(this).attr("data-machitiet");
		var mamau = $(this).closest("tr").find(".mau").attr("data-mamau"); 
		var tenmau = $(this).closest("tr").find(".mau").text();
		var masize = $(this).closest("tr").find(".size").attr("data-masize");
		var tensize = $(this).closest("tr").find(".size").text(); //closet lay ra th cha cua no
		var soluong = $(this).closest("tr").find(".soluong").text();
		var tensp = $("#tensp").text();
		var masp = $("#tensp").attr("data-masp");
		var giatien = $("#giatien").attr("data-value")
		
		
		
		$.ajax({
			
			url:"http://localhost:8080/LOWJISHOP/api/ThemGioHang",
			type:"GET",
			data:{
				masp:masp,
				masize:masize,
				mamau:mamau,
				tensp:tensp,
				giatien:giatien,
				tenmau:tenmau,
				soluong:soluong,
				tensize:tensize,
				machitiet:machitiet
			},
			success : function(value){ // value là giohang.size()
				$(".Giohang").html( "<span>" + value + "</span>") ;
			}
		})

	});
	GanTongTienGioHang();
	
	function GanTongTienGioHang(kiemtra){ // người dùng thay đổi số lượng thì kiemtra=true
		var tongtiensp= 0;
		$(".giatien").each(function(){
			var giatien= $(this).text(); //giá tiền dạng text
			
			var tien = $(this).closest("tr").find(".giatien").attr("data-value");//gias tri tien ban dau co san
			
			var soluong = $(this).closest("tr").find(".soluonggiohang").val();
			
			
			var tongtien = parseInt(tien) *soluong;
			
			
			var format= parseFloat(tongtien).toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString() 
				//alert(giatien + " "+soluong+" "+format);
			if(!kiemtra){
				$(this).html(format);
			}
			
			tongtiensp= tongtiensp + tongtien;
			
			var formatTongTien= tongtiensp.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString()
			$("#tongtien").html(formatTongTien)
		})
	}
	$(".xoasanphamgiohang").click(function(){
		var thiss= $(this);
		var mamau = $(this).closest("tr").find(".mau").attr("data-mamau"); 
		var masize = $(this).closest("tr").find(".size").attr("data-masize");
		var masp = $(this).closest("tr").find(".tensp").attr("data-masp");
		
		$.ajax({
			
			url:"http://localhost:8080/LOWJISHOP/api/XoaGioHang",
			type:"GET",
			data:{
				masp:masp,
				masize:masize,
				mamau:mamau,
				
			},
			success : function(value){ 
				thiss.closest("tr").remove();
				GanTongTienGioHang();
			}
		})
	})
	
	$(".soluonggiohang").change(function(){
		
		var soluong=$(this).val(); // lay ra so luong
		var giatien=$(this).closest("tr").find(".giatien").attr("data-value");
		
		
		var tongtien=soluong * parseInt(giatien);
		
		var format=tongtien.toFixed(3).replace(/(\d)(?=(\d{3})+\.)/g, "$1.").toString();
		$(this).closest("tr").find(".giatien").html(format); //gán tổng tiền vào giá tiền
		GanTongTienGioHang(true);

		  	var mamau = $(this).closest("tr").find(".mau").attr("data-mamau"); 
			var masize = $(this).closest("tr").find(".size").attr("data-masize");
			var masp = $(this).closest("tr").find(".tensp").attr("data-masp");
			
			$.ajax({
				
				url:"http://localhost:8080/LOWJISHOP/api/CapNhatGioHang",
				type:"GET",
				data:{
					masp:masp,
					masize:masize,
					mamau:mamau,
					soluong:soluong	
				},
				success : function(value){ 
					
				}
			})
		
	
  })
  
  


					
					
					
$("body").on("click",".phantrang",function() {
	var sotrang = $(this).text();
	var spbatdau = (sotrang - 1) * 5;
					
	 $.ajax({
					
		url :"http://localhost:8080/LOWJISHOP/api/LaySanPhamLimit",
		type : "GET",
		data : {
		spbatdau : spbatdau,
		},
		success : function(value) {
		var tbodysanpham = $( "#table-sanpham").find("tbody");
	        tbodysanpham.empty();
			tbodysanpham.append(value);
	}
					
	})
})
  $("#checkall").change(function(){	 
	  if(this.checked){ // nếu được check thì duyệt hết checkbox còn lại
		  $("#table-sanpham input").each(function(){
			  $(this).attr("checked",true);
		   })
	  }else{
		  $("#table-sanpham input").each(function(){
			  $(this).attr("checked",false);
		  })
	  }
  })
  $(".xoasp").click(function(){
	   $("#table-sanpham >tbody input:checked").each(function(){
		   var masanpham = $(this).val();
		   var This = $(this);
		   This.closest("tr").remove();
		   $.ajax({
				
				url:"http://localhost:8080/LOWJISHOP/api/XoaSanPham",
				type:"GET",
				data:{
					masp:masanpham,
					
				},
				success : function(value){ 
					This.closest("tr").remove();
				}
			})
	   })

  })

  	var files = [];
	var tenhinh = "";
  $("#hinhanh").change(function(event){// khi file thay đổi thì thực hiện
	  
	  	files =  event.target.files; //trả ra file chứa trong truefile
	  	tenhinh = files[0].name;
	  	forms = new FormData(); // tạo form, gán giá trị cho form
	  	forms.append("file",files[0]);
	  	
	  	$.ajax({
			
			url:"http://localhost:8080/LOWJISHOP/api/UpLoadFile",
			type:"GET",
			data:forms,
			success : function(value){ 
				
			}
		})
	  
  })
  	$("body").on("click",".btnn-chitiet",function(){
  		$(this).remove();
  		var chitietclone = $("#chitietsanpham").clone().removeAttr("id");
  		
  		$("#containerchitietsanpham").append(chitietclone);
  	})
  $("#btnthemsanpham").click(function(event){ 
	  event.preventDefault();
	  var formdata = $("#formsanpham").serializeArray(); //cho phép lấy tất cả giá trị thẻ form, được 1 mảng array, biến mảng array
	  														// thành mảng jsson với key = name,value = giá trị
	  json ={};
	  arraychitiet = [];
	  
	  $.each(formdata, function(i, field){
		 
		  json[field.name] = field.value;
	   
	    });
	 $("#containerchitietsanpham > .chitietsanpham").each(function(){ // duyệt riêng chi tiết và biến nó thành jsson array và push vào trong mảng arr
		 																//
		 objectChitiet = {};
		mausanpham = $(this).find('select[name="mausanpham"]').val();
		sizesanpham = $(this).find('select[name="sizesanpham"]').val();
		soluong = $(this).find('input[name="soluong"]').val();
		
		objectChitiet["mausanpham"] = mausanpham;
		objectChitiet["sizesanpham"] = sizesanpham;
		objectChitiet["soluong"] = soluong;
		
		arraychitiet.push(objectChitiet);
		
	 })
	 json["chitietsanpham"]= arraychitiet;
	 json["hinhsanpham"]= tenhinh;
	 //console.log(json);
	  $.ajax({
			
			url:"http://localhost:8080/LOWJISHOP/api/themsanphamm",
			type:"POST",
			data:{
				dataJson:JSON.stringify(json) // biến jsson thành chuỗi
			},
			success : function(value){ 
				
			}
		})
  })
  
  $("#btnCAPNHAT").click(function(event){
	  event.preventDefault();
	  var formdata = $("#formsanpham").serializeArray(); //cho phép lấy tất cả giá trị thẻ form, được 1 mảng array, biến mảng array
	  														// thành mảng jsson với key = name,value = giá trị
	  json ={};
	  arraychitiet = [];
	  
	  $.each(formdata, function(i, field){
		 
		  json[field.name] = field.value;
	   
	    });
	 $("#containerchitietsanpham > .chitietsanpham").each(function(){ // duyệt riêng chi tiết và biến nó thành jsson array và push vào trong mảng arr
		 																//
		 objectChitiet = {};
		mausanpham = $(this).find('select[name="mausanpham"]').val();
		sizesanpham = $(this).find('select[name="sizesanpham"]').val();
		soluong = $(this).find('input[name="soluong"]').val();
		
		objectChitiet["mausanpham"] = mausanpham;
		objectChitiet["sizesanpham"] = sizesanpham;
		objectChitiet["soluong"] = soluong;
		
		arraychitiet.push(objectChitiet);
		
	 })
	 json["masanpham"]= masanpham;
	 json["chitietsanpham"]= arraychitiet;
	 json["hinhsanpham"]= tenhinh;
	 console.log(json);
	  $.ajax({
			
			url:"http://localhost:8080/LOWJISHOP/api/capnhatsanpham",
			type:"POST",
			data:{
				dataJson:JSON.stringify(json) // biến jsson thành chuỗi
			},
			success : function(value){ 
				
			}
		})
	  
  })
  
  $("body").on("click",".capnhatsanpham",function(){
	 masanpham = $(this).attr("data-id");
	 
	 $("#btnCAPNHAT").removeClass("hidden");
	 $("#btnTHOAT").removeClass("hidden");
	 $("#btnthemsanpham").addClass("hidden");

	 
	 $.ajax({
			
			url:"http://localhost:8080/LOWJISHOP/api/LayDanhSachSanPhamTheoMa",
			type:"POST",
			data:{
				masanpham:masanpham
			},
			success : function(value){ 
				
				$("#tensanpham").val(value.tensanpham);
				$("#giatien").val(value.giatien);
				$("#mota").val(value.tensanpham);
				
				if(value.gianhcho == "nam"){
					$("#namm").prop("checked",true);
				}else{
					$("#nuu").prop("checked",true);
				}
				
				$("#danhmucsanpham").val(value.danhmucsanpham.madanhmuc);
				
				$("#containerchitietsanpham").empty();
				
				var countchitiet = value.chitietsanpham.length;
				for(i=0; i<countchitiet; i++){
					var chitietclone = $("#chitietsanpham").clone().removeAttr("id");

					if(i < countchitiet -1 ){
						chitietclone.find(".btnn-chitiet").remove();
					}
					
					chitietclone.find("#sizesanpham").val(value.chitietsanpham[i].sizesanpham.masize);
					chitietclone.find("#mausanpham").val(value.chitietsanpham[i].mausanpham.mamau);
					chitietclone.find("#soluong").val(value.chitietsanpham[i].soluong);
					$("#containerchitietsanpham").append(chitietclone);
				}
				
			}
		})
  })
$("#aaa").click(function(){
	alert("Áđâsđa");
})
})



