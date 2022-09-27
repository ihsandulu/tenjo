<?php 
	date_default_timezone_set("Asia/Bangkok");
	$identity=$this->db->get("identity")->row();

	//cek user
	$userd["user_id"]=$this->session->userdata("user_id");
	if(current_url()!=site_url("login")){
		$us=$this->db
		->join("position","position.position_id=user.position_id","left")
		->get_where('user',$userd);	
		//echo $this->db->last_query();die;	
		if($us->num_rows()>0)
		{
			foreach($us->result() as $user){		
				foreach($this->db->list_fields('user') as $field)
				{
					$data[$field]=$user->$field;
				}	
				foreach($this->db->list_fields('position') as $field)
				{
					$data[$field]=$user->$field;
				}		
			}
		}else{	
			 $this->session->sess_destroy();
			redirect(site_url("login"));		
		}
	}
?>

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<meta charset="utf-8" />
<title><?=$identity->identity_name;?></title>
<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />

<link rel="icon" type="image/png" href="<?=base_url("assets/images/global/".$identity->identity_picture);?>">	
<link href="<?=base_url('assets/css/bootstrap.min.css');?>" rel="stylesheet">
<link href="<?=base_url('assets/css/datepicker3.css');?>" rel="stylesheet">
<link href="<?=base_url('assets/assets/css/animate.css');?>" rel="stylesheet">  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">   
<link rel="stylesheet" href="<?=base_url('assets/css/fonts.googleapis.com.css');?>" />
<link rel="stylesheet" href="<?=base_url('assets/css/jquery-ui.css');?>">

<script src="<?=base_url("assets/js/jquery-1.11.1.min.js");?>"></script>
<script type="text/javascript" src="<?=base_url('ckeditor/ckeditor.js');?>"></script>
<script src="<?=base_url('assets/js/jquery.js');?>"></script>
<script src="<?=base_url('assets/js/jquery.validate.js');?>"></script>

<script src="<?=base_url('assets/js/bootstrap-datepicker.js');?>"></script>
<script src="<?=base_url('assets/js/jquery-ui.js');?>"></script>	
<link href="<?=base_url('assets/css/jquery.dataTables.min.css');?>" rel="stylesheet">
<script src="<?=base_url("assets/js/jquery.dataTables.min.js");?>"></script>

<!-- ace styles -->
<link rel="stylesheet" href="<?=base_url("assets/css/ace.min.css");?>" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
    <link rel="stylesheet" href="<?=base_url("assets/css/ace-part2.min.css");?>" class="ace-main-stylesheet" />
<![endif]-->
<link rel="stylesheet" href="<?=base_url("assets/css/ace-skins.min.css");?>" />
<link rel="stylesheet" href="<?=base_url("assets/css/ace-rtl.min.css");?>" />

<!--[if lte IE 9]>
  <link rel="stylesheet" href="<?=base_url("assets/css/ace-ie.min.css");?>" />
<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="<?=base_url("assets/js/ace-extra.min.js");?>"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
<script src="<?=base_url("assets/js/html5shiv.min.js");?>"></script>
<script src="<?=base_url("assets/js/respond.min.js");?>"></script>
<![endif]-->
	
<style>
.border{border:black solid 1px;}
</style>

<script>
	$(document).ready( function () {
		 $('#dataTable').DataTable( {
			"order": [[ 0, "desc" ]],
			 "iDisplayLength": 25
		} );
		
		 $('#parameter').DataTable( {
			"order": [[ 3, "asc" ],[ 4, "desc" ],[ 2, "desc" ]],
			 "iDisplayLength": 25
		} );

	} );
</script>
<script>
	$(document).ready(function() {	
		$("form").validate();
	});
	
	function bounceIn(a){
		$(a).addClass('animated bounceIn').parent().parent().addClass('animated bounceIn');
		setTimeout(function(){
			$(a).removeClass('animated bounceIn').parent().parent().removeClass('animated bounceIn');
		},500);
	}
</script>
<script>
function addZero(i) {
    if (i < 10) {
        i = "0" + i;
    }
    return i;
}

function myFunction() {
    var d = new Date();
    var x = document.getElementById("demo");
    var h = addZero(d.getHours());
    var m = addZero(d.getMinutes());
    var s = addZero(d.getSeconds());
    //alert( h + ":" + m + ":" + s);
	if(h + ":" + m =="07:15"){window.location.href="<?=site_url("api/singkron");?>";}
} 

myFunction();
setInterval(function(){
myFunction();
},3600000);
</script>
<script>
function numberWithCommas(x) {
    var parts = x.toString().split(",");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return parts.join(",");
}

function kosong(objek){
	if(objek.value==0){objek.value='';}
}

function pemisah(objek,type) {
	if(type=="text"){
   	a = $(objek).text();
   }
   if(type=="val"){
   	a = $(objek).val();
   }
   b = a.replace(/[^\d]/g,"");
   c = "";
   panjang = b.length;
   j = 0;
   for (i = panjang; i > 0; i--) {
     j = j + 1;
     if (((j % 3) == 1) && (j != 1)) {
       c = b.substr(i-1,1) + "." + c;
     } else {
       c = b.substr(i-1,1) + c;
     }
   }
   
   if(type=="text"){
   	a = $(objek).text(c);
   }
   if(type=="val"){
   	a = $(objek).val(c);
   }
}
</script>