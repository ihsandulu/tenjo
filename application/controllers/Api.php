<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');

/*
* sebelum update script mohon synch code dulu
*/
class api extends CI_Controller {

    function __construct() {
		header('Access-Control-Allow-Origin: *');
		header("Access-Control-Allow-Methods: GET, POST, PUT, OPTIONS, DELETE");
        parent::__construct();
		$identity_server=$this->db->get("identity")->row()->identity_server;
    }

    function index() {
        $this->djson(array("connect"=>"ok"));
    }
	   
  	function datasiswahutang(){
		//user
		$whereuser["user_nisn"]=$this->input->get("user_nisn");
		$whereuser["sekolah_id"]=$this->input->get("sekolah_id");
		$user=$this->db
		->join("kelas","kelas.kelas_id=user.kelas_id","left")
		->get_where("user",$whereuser);
		//echo $this->db->last_query();
		
		//tagihan
		$tagihan=$this->db
		->select("SUM(transaction_amount)AS tagihan")
		//->group_start()
		//->where("kelas_id",$user->kelas_id)
		//->or_where("kelas_id",0)
		//->group_end()
		->where("transaction_type","Kredit")
		->group_by("sekolah_id")
		->get("transaction");
		//echo $this->db->last_query();
		if($tagihan->num_rows()>0){$tagihan=$tagihan->row()->tagihan;}else{$tagihan=0;}
		
		//pembayaran
		$pembayaran=$this->db
		->select("SUM(transaction_amount)AS pembayaran")
		->where("user_nisn",$user->row()->user_nisn)
		->where("sekolah_id",$user->row()->sekolah_id)
		->group_by("user_nisn")
		->get("transaction");
		//echo $this->db->last_query();
		if($pembayaran->num_rows()>0){$pembayaran=$pembayaran->row()->pembayaran;}else{$pembayaran=0;}
		
		$saldo=$tagihan-$pembayaran;
		
		
		if($user->num_rows()>0){
			foreach($user->result() as $user){
				echo "Name: ".$user->user_name.". Class: ".$user->kelas_name.". Saldo: Rp ".number_format($saldo,0,",",".");
			}
		}else{
			echo "No Data!";
		}
	}
		
	function saldo($type,$nisn){
		$uang=$this->db
		->select("SUM(tabungan_amount)as saldo")
		->where("user_nisn",$nisn)
		->where("tabungan_type",$type)
		->get("tabungan");
		foreach($uang->result() as $uang){
			return $uang=$uang->saldo;
		}
	}
	   
  	function datasiswa(){
		$where['user_nisn']=$this->input->get("user_nisn");
		$where['sekolah_id']=$this->input->get("sekolah_id");
		$cek=$this->db
		->join("kelas","kelas.kelas_id=user.kelas_id","left")
		->get_where("user",$where);
		if($cek->num_rows()>0){
			foreach($cek->result() as $cek){
				$saldo=$this->saldo("Debet",$where['user_nisn'])-$this->saldo("Kredit",$where['user_nisn']);
				echo "Name: ".$cek->user_name.". Class: ".$cek->kelas_name.". Saldo: Rp ".number_format($saldo,0,",",".");
			}
		}else{
			echo "No Data!";
		}
	}
	   
  	function cekuser(){
		$user=$this->input->get("user");
		$isi=$this->input->get("isi");
		$sekolah_id=$this->input->get("sekolah_id");
		$cek=$this->db
		->where($user,$isi)
		->where("sekolah_id",$sekolah_id)
		->get("user");
		if($cek->num_rows()>0){
			echo "ada";
		}else{
			echo "kosong";
		}
	}
	
	function cekmatpel(){
		$matpel_name=$this->input->get("matpel_name");
		$cek=$this->db
		->where("matpel_name",$matpel_name)
		->get("matpel");
		if($cek->num_rows()>0){
			echo "ada";
		}else{
			echo "kosong";
		}
	}
		
	function cekgrup(){		
		$grup_name=$this->input->get("grup_name");
		$sekolah_id=$this->input->get("sekolah_id");
		$cek=$this->db
		->where("grup_name",$grup_name)
		->where("sekolah_id",$sekolah_id)
		->get("user");
		if($cek->num_rows()>0){
			echo "ada";
		}else{
			echo "kosong";
		}
	}
	
	function isi_kelas_sekolah(){		
		$sekolah_id=$this->input->get("sekolah_id");
		$cek=$this->db
		->join("kelas","kelas.kelas_id=kelas_sekolah.kelas_id","left")
		->where("sekolah_id",$sekolah_id)
		->get("kelas_sekolah");
		foreach($cek->result() as $kelassekolah){?>
		 <option value="<?=$kelassekolah->kelas_sekolah_id;?>"><?=$kelassekolah->kelas_name;?></option>	
		<?php
        }
	}
	
	function isi_kelas(){		
		$sekolah_id=$this->input->get("sekolah_id");
		$kel=$this->db->get("kelas");
		foreach($kel->result() as $kelas){
			$kelassekolah=$this->db
			->where("kelas_id",$kelas->kelas_id)
			->where("sekolah_id",$sekolah_id)
			->get("kelas_sekolah")->num_rows();
			if($kelassekolah==0){
		?>
		  <option value="<?=$kelas->kelas_id;?>"><?=$kelas->kelas_name;?></option>
		 <?php }}
	}
	
	function inputkelas(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$kelas_id=$this->input->get("kelas_id");
		foreach($kelas_id as $a=>$b){
			$input["kelas_id"]=$b;
			$this->db->insert("kelas_sekolah",$input);
			echo $this->db->insert_id().",";
		}
		
	}
	
	function deletekelas(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$kelas_sekolah_id=$this->input->get("kelas_sekolah_id");
		foreach($kelas_sekolah_id as $a=>$b){
			$input["kelas_sekolah_id"]=$b;
			$this->db->delete("kelas_sekolah",$input);
			echo $this->db->last_query().",";
		}
		
	}
	
	function isi_matpel_sekolah(){		
		$sekolah_id=$this->input->get("sekolah_id");
		$cek=$this->db
		->join("matpel","matpel.matpel_id=matpel_sekolah.matpel_id","left")
		->where("sekolah_id",$sekolah_id)
		->get("matpel_sekolah");
		foreach($cek->result() as $matpelsekolah){?>
		 <option value="<?=$matpelsekolah->matpel_sekolah_id;?>"><?=$matpelsekolah->matpel_name;?></option>	
		<?php
        }
	}
	
	function isi_matpel(){		
		$sekolah_id=$this->input->get("sekolah_id");
		$kel=$this->db->get("matpel");
		foreach($kel->result() as $matpel){
			$matpelsekolah=$this->db
			->where("matpel_id",$matpel->matpel_id)
			->where("sekolah_id",$sekolah_id)
			->get("matpel_sekolah")->num_rows();
			if($matpelsekolah==0){
		?>
		  <option value="<?=$matpel->matpel_id;?>"><?=$matpel->matpel_name;?></option>
		 <?php }}
	}
	
	function inputmatpel(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$matpel_id=$this->input->get("matpel_id");
		foreach($matpel_id as $a=>$b){
			$input["matpel_id"]=$b;
			$this->db->insert("matpel_sekolah",$input);
			echo $this->db->insert_id().",";
		}
		
	}
	
	function deletematpel(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$matpel_sekolah_id=$this->input->get("matpel_sekolah_id");
		foreach($matpel_sekolah_id as $a=>$b){
			$input["matpel_sekolah_id"]=$b;
			$this->db->delete("matpel_sekolah",$input);
			echo $this->db->last_query().",";
		}
		
	}
	
	function isi_grup_siswa(){		
		$sekolah_id=$this->input->get("sekolah_id");
		$kelas_id=$this->input->get("kelas_id");
		$grup_id=$this->input->get("grup_id");
		$cek=$this->db
        ->join("user","user.user_id=grup_siswa.user_id","left")
		->where("grup_siswa.sekolah_id",$sekolah_id)
		->where("grup_siswa.kelas_id",$kelas_id)
		->where("grup_siswa.grup_id",$grup_id)
		->get("grup_siswa");
		foreach($cek->result() as $siswagrup){?>
		 <option value="<?=$siswagrup->grup_siswa_id;?>"><?=$siswagrup->user_name;?></option>	
		<?php
        }
	}
	
	function isi_siswa(){	
		$sekolah_id=$this->input->get("sekolah_id");
		$kelas_id=$this->input->get("kelas_id");
		$position_id=$this->input->get("position_id");	
		$sis=$this->db
		->where("kelas_id",$kelas_id)
		->where("position_id",$position_id)
		->where("sekolah_id",$sekolah_id)
		->get("user");
		foreach($sis->result() as $siswa){
			$siswagrup=$this->db
			->where("user_id",$siswa->user_id)
			->where("kelas_id",$kelas_id)
			->where("sekolah_id",$sekolah_id)
			->get("grup_siswa")->num_rows();
			if($siswagrup==0){
			?>
			  <option value="<?=$siswa->user_id;?>"><?=$siswa->user_name;?></option>
		 <?php }}
	}
	
	function inputsiswa(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$input["kelas_id"]=$this->input->get("kelas_id");
		$input["grup_id"]=$this->input->get("grup_id");
		$user_id=$this->input->get("user_id");
		foreach($user_id as $a=>$b){
			$input["user_id"]=$b;
			$this->db->insert("grup_siswa",$input);
			echo $this->db->insert_id().",";
		}
		
	}
	
	function deletesiswa(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$grup_siswa_id=$this->input->get("grup_siswa_id");
		foreach($grup_siswa_id as $a=>$b){
			$input["grup_siswa_id"]=$b;
			$this->db->delete("grup_siswa",$input);
			echo $this->db->last_query().",";
		}
		
	}
	
	
	
	function isi_kelas_sekolah_guru(){		
		$sekolah_id=$this->input->get("sekolah_id");
		$user_id=$this->input->get("user_id");
		$kel=$this->db
		->join("kelas","kelas.kelas_id=kelas_sekolah.kelas_id","left")
		->where("sekolah_id",$sekolah_id)
		->get("kelas_sekolah");
		echo $this->db->last_query();
		foreach($kel->result() as $kelas){
			$kelasguru=$this->db
			->where("user_id",$user_id)
			->where("kelas_id",$kelas->kelas_id)
			->where("sekolah_id",$sekolah_id)
			->get("kelas_guru")->num_rows();
			if($kelasguru==0){
			?>
			  <option value="<?=$kelas->kelas_id;?>"><?=$kelas->kelas_name;?></option>
			 <?php }
		 }
	}
	
	function isi_kelas_guru(){	
		$sekolah_id=$this->input->get("sekolah_id");
		$user_id=$this->input->get("user_id");
		$kela=$this->db
		->join("kelas","kelas.kelas_id=kelas_guru.kelas_id","left")
		->where("kelas_guru.sekolah_id",$sekolah_id)
		->where("kelas_guru.user_id",$user_id)
		->get("kelas_guru");
		foreach($kela->result() as $kelasguru){												
		?>
		  <option value="<?=$kelasguru->kelas_guru_id;?>"><?=$kelasguru->kelas_name;?></option>
		 <?php }
	}
	
	function inputkelasguru(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$input["user_id"]=$this->input->get("user_id");
		$kelas_id=$this->input->get("kelas_id");
		foreach($kelas_id as $a=>$b){
			$input["kelas_id"]=$b;
			$this->db->insert("kelas_guru",$input);
			echo $this->db->insert_id().",";
		}
		
	}
	
	function deletekelasguru(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$kelas_guru_id=$this->input->get("kelas_guru_id");
		foreach($kelas_guru_id as $a=>$b){
			$input["kelas_guru_id"]=$b;
			$this->db->delete("kelas_guru",$input);
			echo $this->db->last_query().",";
		}
		
	}
	
	
	
	function isi_grup_id_guru(){		
		$sekolah_id=$this->input->get("sekolah_id");
		$user_id=$this->input->get("user_id");
		$gru=$this->db
		->join("kelas_guru","kelas_guru.kelas_id=grup.kelas_id","inner")
		->where("grup.sekolah_id",$sekolah_id)
		->where("kelas_guru.user_id",$user_id)
		->get("grup");
		foreach($gru->result() as $grup){
		$gurugrup=$this->db
		->where("user_id",$user_id)
		->where("grup_id",$grup->grup_id)
		->where("sekolah_id",$sekolah_id)
		->get("grup_guru")->num_rows();
		if($gurugrup==0){
		?>
		  <option value="<?=$grup->grup_id;?>"><?=$grup->grup_name;?></option>
		 <?php }}
	}
	
	function isi_grup_guru(){	
		$sekolah_id=$this->input->get("sekolah_id");
		$user_id=$this->input->get("user_id");
		$sisa=$this->db
		->join("grup","grup.grup_id=grup_guru.grup_id","left")
		->where("grup_guru.sekolah_id",$sekolah_id)
		->where("grup_guru.user_id",$user_id)
		->get("grup_guru");
		foreach($sisa->result() as $gurugrup){												
		?>
		  <option value="<?=$gurugrup->grup_guru_id;?>"><?=$gurugrup->grup_name;?></option>
		 <?php }
	}
	
	function inputgrupguru(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$input["user_id"]=$this->input->get("user_id");
		$grup_id=$this->input->get("grup_id");
		foreach($grup_id as $a=>$b){
			$input["grup_id"]=$b;
			$input["kelas_id"]=$this->db->get_where("grup",array("grup_id"=>$input["grup_id"]))->row()->kelas_id;
			$this->db->insert("grup_guru",$input);
			echo $this->db->insert_id().",";
		}
		
	}
	
	function deletegrupguru(){		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$grup_guru_id=$this->input->get("grup_guru_id");
		foreach($grup_guru_id as $a=>$b){
			$input["grup_guru_id"]=$b;
			$this->db->delete("grup_guru",$input);
			echo $this->db->last_query().",";
		}
		
	}
	
	function publish(){
		$where["sekolah_id"]=$this->input->get("sekolah_id");
		$where["materi_id"]=$this->input->get("materi_id");
		$materi_publish=$this->input->get("materi_publish");
		if($materi_publish==0){
			echo "Publish"; $input["materi_publish"]=1;
		}else{
			echo "Unpublish"; $input["materi_publish"]=0;
		}
		$this->db->update("materi",$input,$where);
	}
	
	function publishsoal(){
		$where["sekolah_id"]=$this->input->get("sekolah_id");
		$where["materi_id"]=$this->input->get("materi_id");
		$soal_publish=$this->input->get("soal_publish");
		if($soal_publish==0){
			echo "Publish"; $input["soal_publish"]=1;
		}else{
			echo "Unpublish"; $input["soal_publish"]=0;
		}
		$this->db->update("materi",$input,$where);
	}
	
	function jawaban(){
		$sekolah_id=$this->input->get("sekolah_id");
		$soal_id=$this->input->get("soal_id");
		$answer_key=$this->input->get("answer_key");
	}
	
	function cek_publish_materi(){
		$where["sekolah_id"]=$this->input->get("sekolah_id");
		$where["materi_id"]=$this->input->get("materi_id");
		$publish=$this->db->get_where("materi",$where)->row()->materi_publish;
		echo $publish;
	}
	
	function cek_publish_soal(){
		$where["sekolah_id"]=$this->input->get("sekolah_id");
		$where["materi_id"]=$this->input->get("materi_id");
		$publish=$this->db->get_where("materi",$where)->row()->soal_publish;
		$status=$this->db->get_where("materi",$where)->row()->soal_status;
		$data["publish"]=$publish;
		$data["status"]=$status;
		$this->djson($data);
	}
	function noltest(){
		$where["sekolah_id"]=$this->input->get("sekolah_id");
		$where["materi_id"]=$this->input->get("materi_id");
		$where["user_id"]=$this->input->get("user_id");
		$jawaban=$this->input->get("jawaban");
		$soal_key=$this->input->get("soal_key");
		$ceksoal=$this->db->get_where("test",$where);
		//echo $this->db->last_query();
		if($ceksoal->num_rows()>0){
			foreach($ceksoal->result() as $soal){
				$input["test_nilai"]="0";
				$this->db->update("test",$input,$where);
				if($this->db->affected_rows()>0){$message = "Update Success ".$input["test_nilai"];}else{$message = "Update Failed";}
				echo $soal->test_id;
			}
		}else{			
			$where["test_nilai"]="0";
			$this->db->insert("test",$where);
			//echo $this->db->last_query();
			if($this->db->insert_id()>0){$message = "Insert Success ".$where["test_nilai"]; echo $this->db->insert_id();}else{$message = "Insert Failed"; echo $message;}
			
		}
	}	
	
	function cek_jawaban(){
		$where["sekolah_id"]=$this->input->get("sekolah_id");
		$where["materi_id"]=$this->input->get("materi_id");
		$where["user_id"]=$this->input->get("user_id");
		$where["soal_id"]=$this->input->get("soal_id");
		
		$jawaban=$this->input->get("jawaban");
		$key=$this->input->get("key");
		
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		$input["materi_id"]=$this->input->get("materi_id");
		$input["user_id"]=$this->input->get("user_id");
		$input["soal_id"]=$this->input->get("soal_id");
		$input["test_id"]=$this->input->get("test_id");
		$input["soal_key"]=$key;
		$input["test_detail_answer"]=$jawaban;
		$ceksoal=$this->db->get_where("test_detail",$where);
		
		if($ceksoal->num_rows()>0){
			foreach($ceksoal->result() as $soal){
				$this->db->update("test_detail",$input,$where);
				echo $this->db->last_query();
				if($this->db->affected_rows()>0){echo "Update Success";}else{echo "Update Failed";}
			}
		}else{
			$this->db->insert("test_detail",$input);
			//echo $this->db->last_query();
			if($this->db->insert_id()>0){echo "Insert Success";}else{echo "Insert Failed";}
		}
		
	}
	
	function status(){
		$input["soal_status"]=$this->input->get("soal_status");
		$where["sekolah_id"]=$this->input->get("sekolah_id");
		$where["materi_id"]=$this->input->get("materi_id");
		$this->db->update("materi",$input,$where);
		//echo $this->db->last_query();
		if($this->db->affected_rows()>0){echo $input["soal_status"];}else{echo "Update Failed";}
	}
	
	function hitung_nilai(){
		$materi_id=$this->input->get("materi_id");
		$sekolah_id=$this->input->get("sekolah_id");
		$user_id=$this->input->get("user_id");
		
		$where["materi_id"]=$materi_id;
		$jumlahsoal=$this->db->get_where("soal",$where)->num_rows();
		
		$nil=$this->db
		->select("test_detail.*,soal.soal_key as jwb")
		->join("soal","soal.soal_id=test_detail.soal_id","left")
		->where("test_detail.sekolah_id",$sekolah_id)
		->where("test_detail.user_id",$user_id)
		->where("test_detail.materi_id",$materi_id)
		->get("test_detail");
		$tnilai=0;
		//echo $this->db->last_query();
		foreach($nil->result() as $nilai){
			if($nilai->jwb==$nilai->test_detail_answer){$tnilai++;}
		}
		if($jumlahsoal==0){$jumlahsoal=1;}
		echo $nilai_akhir = $tnilai / $jumlahsoal * 100;
	}
	
	function listsiswa(){
		$status=$this->input->get("status");
		$sekolah_id=$this->input->get("sekolah_id");
		$grup_id=$this->input->get("grup_id");
		$kelas_id=$this->input->get("kelas_id");
		?>
		<?php
				
		$st=array(1=>"Masuk","Sakit","Izin","Alpha");
		$bt=array(1=>"primary","info","warning","danger");
								
		if($this->session->userdata("sekolah_id")>0){
			$this->db->where("grup_siswa.sekolah_id",$this->session->userdata("sekolah_id"));
		}
		
		$ab=$this->db
		->join("user","user.user_id=grup_siswa.user_id","left")
		->where("grup_id",$grup_id)
		->get("grup_siswa");
		//print_r($this->db->last_query());
		foreach($ab->result() as $absensi){
		
		//cek siswa
		$ceksiswa=$this->db
		->where("sekolah_id",$absensi->sekolah_id)
		->where("absensi_date",$this->input->get("absensi_date"))
		->where("user_id",$absensi->user_id)
		->where("grup_id",$absensi->grup_id)
		->get("absensi");
		//echo $this->db->last_query();
		//echo $ceksiswa->num_rows();
		if($ceksiswa->num_rows()>0){
			$stat=1;						
			$matr="uwabsensi";
			$absensiisi="wabsensiisi";
			foreach($ceksiswa->result() as $ceksiswanya){
				$keterangan=$ceksiswanya->absensi_remarks;
				$statusnya=$ceksiswanya->absensi_status;
				$absensi_id=$ceksiswanya->absensi_id;
			}
		}else{
			$stat=0;				
			$matr="uabsensi";
			$absensiisi="absensiisi";
		}
		if($stat==$status)		
		{
		?>
		<?php 			
										
		if($this->session->userdata("position_id")==4){									
			$display="displayinline";				
		}else{
			$display="";
		}
		?>							
		
		<div class="col-md-6  col-sm-6 col-xs-12 <?=$display;?>" style="margin-bottom:20px;" id="absensiu<?=$absensi->user_id;?>">
		<button type="button" id="absensi<?=$absensi->user_id;?>" class="<?=$matr;?> col-md-12 col-sm-12 col-xs-12">
			<div class="<?=$absensiisi;?>" id="absensiisi<?=$absensi->user_id;?>"><?=$absensi->user_name;?></div>
		</button>
			<?php if($this->session->userdata("position_id")!="4"){?>
			<?php if($status==0){?>
			<div class="action col-md-12">
				<input id="absensi_remarks<?=$absensi->user_id;?>" data-toggle="tooltip" title="Remarks" class="form-control" style="width:100%; height:100%; float:left;" placeholder="Remarks">
				<div class="" style="padding:0px; width:25%; height:100%; float:left;">										
					<button onClick="absensi('<?=$absensi->user_id;?>','1','#absensi_remarks<?=$absensi->user_id;?>')" data-toggle="tooltip" title="Attendance" class="btn btn-primary btn-xs fa fa-hand-peace-o" id="absensi<?=$absensi->user_id;?>" value="1" style="width:100%; height:100%; color:white;"></button>
				</div>
				<div class="" style="padding:0px; width:25%; height:100%; float:left;">										
					<button onClick="absensi('<?=$absensi->user_id;?>','2','#absensi_remarks<?=$absensi->user_id;?>')" data-toggle="tooltip" title="Sick" class="btn btn-info btn-xs fa fa-medkit" id="absensi<?=$absensi->user_id;?>" value="2" style="width:100%; height:100%; color:white;"></button>
				</div>
				<div class="" style="padding:0px; width:25%; height:100%; float:left;">										
					<button onClick="absensi('<?=$absensi->user_id;?>','3','#absensi_remarks<?=$absensi->user_id;?>')" data-toggle="tooltip" title="Permit" class="btn btn-warning btn-xs fa fa-weixin" id="absensi<?=$absensi->user_id;?>" value="3" style="width:100%; height:100%; color:white;"></button>
				</div>
				<div class="" style="padding:0px; width:25%; height:100%; float:left;">										
					<button onClick="absensi('<?=$absensi->user_id;?>','4','#absensi_remarks<?=$absensi->user_id;?>')" data-toggle="tooltip" title="Absent" class="btn btn-danger btn-xs fa fa-slack" id="absensi<?=$absensi->user_id;?>" value="4" style="width:100%; height:100%; color:white;"></button>
				</div>
			</div>
				<?php }else{?>
				<div class="btn btn-<?=$bt[$statusnya];?> btn-xs col-md-12" style="">Status : <?=$st[$statusnya];?><br/>Remarks : <?=$keterangan;?></div>
				<div class="btn btn-danger btn-xs" style="position:absolute; right:12px;" onclick="delete_absensi('<?=$absensi_id;?>')">&times;</div>
				<?php }?>									
			<?php }?>
		</div>
		<?php }}?>
		<?php
	}
	
	function absensi(){
		$where1['sekolah_id']=$this->input->get("sekolah_id");
		$where1['grup_id']=$this->input->get("grup_id");
		$where1['user_id']=$this->input->get("user_id");
		$where1['absensi_date']=$this->input->get("absensi_date");
		
		$input2['absensi_status']=$this->input->get("absensi_status");
		$input2['absensi_remarks']=$this->input->get("absensi_remarks");
		
		$input1['sekolah_id']=$this->input->get("sekolah_id");
		$input1['grup_id']=$this->input->get("grup_id");
		$input1['user_id']=$this->input->get("user_id");
		$input1['absensi_status']=$this->input->get("absensi_status");
		$input1['absensi_date']=$this->input->get("absensi_date");
		$input1['absensi_status']=$this->input->get("absensi_status");
		$input1['absensi_remarks']=$this->input->get("absensi_remarks");
		
		$absen=$this->db->get_where("absensi",$where1);
		echo $this->db->last_query();
		if($absen->num_rows()>0){
			$this->db->update("absensi",$input2,$where1);
			echo $this->db->affected_rows();
		}else{
			$this->db->insert("absensi",$input1);
			echo $this->db->insert_id();		
		}
	
	}
	
	public function delete_absensi(){
		$where["absensi_id"]=$this->input->get("absensi_id");
		$this->db->delete("absensi",$where);
		echo $this->db->affected_rows();
	}
	
	public function cari_materi(){
	$grup_id=$this->input->get("grup_id");
	$materi_id=$this->input->get("grup_id");
	?>
	<option value="0" <?=($materi_id==0)?'selected="selected"':"";?>>Select Lesson</option>
	<?php 
	if($this->session->userdata("sekolah_id")>0){
		$this->db->where("materi.sekolah_id",$this->session->userdata("sekolah_id"));
	}
	if($this->session->userdata("position_id")=="3"){
		$this->db
		->join("grup_guru","grup_guru.grup_id=materi.grup_id","left")
		->where("grup_guru.user_id",$this->session->userdata("user_id"));
	}
	if($grup_id>0){
		$this->db->where("materi.grup_id",$grup_id);
	}
	$mat=$this->db
	->get("materi");
	foreach($mat->result() as $materi){?>							
	<option value="<?=$materi->materi_id;?>" <?=($materi_id==$materi->materi_id)?'selected="selected"':"";?>><?=$materi->materi_title;?></option>
	<?php }
	
	}
	
	public function tampil_materi(){
		$kelas_id=$this->input->get("kelas_id");
		$matpel_id=$this->input->get("matpel_id");
		$grup_id=$this->input->get("grup_id");
		$sekolah_id=$this->input->get("sekolah_id");
		$this->db->where("kelas_id",$kelas_id);
		if($sekolah_id!=0){
			$this->db->where("materi.sekolah_id",$sekolah_id);
		}
		$mat=$this->db
		->join("grup","grup.grup_id=materi.grup_id","left")
		->join("sekolah","sekolah.sekolah_id=materi.sekolah_id","left")
		->or_where("materi.sekolah_id","0")
		->where("matpel_id",$matpel_id)
		->get("materi");
		//echo $this->db->last_query();
		foreach($mat->result() as $materi){
		if($materi->sekolah_id==0){$btn="danger";}else{$btn="primary";}
		?>
		<div onclick="masukin_materi('<?=$materi->materi_title;?>','<?=$grup_id;?>','<?=$materi->materi_id;?>','<?=$sekolah_id;?>','<?=$materi->materi_id;?>')" class="col-md-4 col-sm-4 col-xs-12" style="margin-bottom:10px;">
			<div class="btn btn-<?=$btn;?> btn-block">
				<?=$materi->materi_title;?><br/>
				Group : <?=$materi->grup_name;?><br/>
				School : <?=$materi->sekolah_name;?>
				<div id="materi_content<?=$materi->materi_id;?>" style="display:none;"><?=$materi->materi_content;?></div>
			</div>
		</div>
		<?php
		}?>
		
		<?php
	} 
	
	public function masukin_materi(){
		$materi_title=$this->input->get("materi_title");
		$materi_content=$this->input->get("materi_content");
		$grup_id=$this->input->get("grup_id");
		$sekolah_id=$this->input->get("sekolah_id");
		$materi_server=$this->input->get("materi_server");		
		
		if($materi_content!=""){
			$identity_server=$this->db->get("identity")->row()->identity_server;
			$doc = new DomDocument;
			$doc->validateOnParse = true;
			$doc->loadHtml($materi_content);
			$img = $doc->getElementsByTagName('img');
			foreach( $img as $img ){
				$imgarr = explode("fileman/Uploads/",$img->getAttribute('src'));
				$file=$identity_server."/fileman/Uploads/".$imgarr[1];
				$newfile="fileman\\Uploads\\".$imgarr[1];
				copy($file, $newfile);		
			}
		}
		
		$input["materi_server"]=$materi_server;
		$input["materi_title"]=$materi_title;
		$input["materi_content"]=$materi_content;
		$input["sekolah_id"]=$sekolah_id;
		$input["grup_id"]=$grup_id;
		$this->db->insert("materi",$input);
		if($this->db->insert_id()>0){echo "Insert Success";}else{echo "Insert Failed"; 
		//echo $this->db->last_query();
		}
	}
	
	public function tampil_soal(){
		$materi_id=$this->input->get("materi_id");
		$sekolah_id=$this->input->get("sekolah_id");
		$so=$this->db
		->join("materi","materi.materi_id=soal.materi_id","left")
		->where("soal.sekolah_id","0")
		->where("soal.materi_id",$materi_id)
		->get("soal");
		//echo $this->db->last_query();
		foreach($so->result() as $soal){
			?>
		<div onclick="masukin_soal('<?=$soal->soal_id;?>','<?=$soal->soal_answer1;?>','<?=$soal->soal_answer2;?>','<?=$soal->soal_answer3;?>','<?=$soal->soal_answer4;?>','<?=$soal->soal_picture;?>','<?=$soal->soal_key;?>','<?=$sekolah_id;?>','<?=$materi_id;?>')" class="col-md-12 col-sm-12 col-xs-12" style="margin:20px;">
			<?=$soal->soal_question;?>
			<div class="btn btn-primary btn-block">Get Question
				<div id="soal_question<?=$soal->soal_id;?>" style="word-wrap: break-word; display:none;"><?=$soal->soal_question;?></div>
				<div id="soal_solution<?=$soal->soal_id;?>" style="display:none;"><?=$soal->soal_solution;?></div>
			</div>
		</div>
		<?php
		
		}?>
		
		<?php
	} 
	
	public function masukin_soal(){
		$identity_server=$this->db->get("identity")->row()->identity_server;
		
		$input["materi_id"]=$this->input->get("materi_id");
		$input["sekolah_id"]=$this->input->get("sekolah_id");
		
		
		$input["soal_question"]=$this->input->get("soal_question");
		$input["soal_solution"]=$this->input->get("soal_solution");
		$input["soal_answer1"]=$this->input->get("soal_answer1");
		$input["soal_answer2"]=$this->input->get("soal_answer2");
		$input["soal_answer3"]=$this->input->get("soal_answer3");
		$input["soal_answer4"]=$this->input->get("soal_answer4");
		$input["soal_picture"]=$this->input->get("soal_picture");
		$input["soal_key"]=$this->input->get("soal_key");
		
		if($input["soal_picture"]!=""){
			$file=$identity_server."/assets/images/soal_picture/".$input["soal_picture"];
			$newfile="assets\\images\\soal_picture\\".$input["soal_picture"];
			copy($file, $newfile);
		}
		
		if($input["soal_question"]!=""){
			$identity_server=$this->db->get("identity")->row()->identity_server;
			$doc = new DomDocument;
			$doc->validateOnParse = true;
			$doc->loadHtml($input["soal_question"]);
			$img = $doc->getElementsByTagName('img');
			foreach( $img as $img ){
				$imgarr = explode("fileman/Uploads/",$img->getAttribute('src'));
				$file=$identity_server."/fileman/Uploads/".$imgarr[1];
				$newfile="fileman\\Uploads\\".$imgarr[1];
				copy($file, $newfile);		
			}
		}
		
		if($input["soal_solution"]!=""){
			$identity_server=$this->db->get("identity")->row()->identity_server;
			$doc1 = new DomDocument;
			$doc1->validateOnParse = true;
			$doc1->loadHtml($input["soal_solution"]);
			$img1 = $doc1->getElementsByTagName('img');
			foreach( $img1 as $img1 ){
				$imgarr1 = explode("fileman/Uploads/",$img1->getAttribute('src'));
				$file1=$identity_server."/fileman/Uploads/".$imgarr1[1];
				$newfile1="fileman\\Uploads\\".$imgarr1[1];
				copy($file1, $newfile1);		
			}
		}
		
		$this->db->insert("soal",$input);
		if($this->db->insert_id()>0){echo "Insert Success";}else{echo "Insert Failed"; 
		echo $this->db->last_query();
		}
	}
	
	public function update_refresh(){
		$where["position_id"]=$this->input->get("position_id");
		$input["refresh_status"]=$this->input->get("refresh_status");
		$this->db->update("refresh",$input,$where);
		if($this->db->affected_rows()>0){echo "Update Success";}else{echo "Update Failed";}
	}
	
	public function get_refresh(){
		$where["position_id"]=$this->input->get("position_id");
		$re=$this->db->get_where("refresh",$where);
		foreach($re->result() as $refresh){
			echo $refresh->refresh_status;
		}
	}
	
	//singkronisasi
	/*
	Pengecualian:
	Diisi manual = identity, kelas, matpel,position
	Tidak dilempar = "soal","soal_umum","materi","sekolah"
	*/
	
	public function hapus_table(){
		$table=$this->input->get("table");
		$where["sekolah_id"]=$this->input->get("sekolah_id");
		$this->db->delete($table,$where);
		if($this->db->affected_rows()>0){echo "Delete ".$table." Success<br/>";}else{echo $this->db->last_query()."<br/>";}
	}
	
	public function insert_table(){	
		$table=$this->input->get("table");
		
		foreach($this->db->list_fields($table) as $field)
		{
			//if($field!=$table."_id"){
				$input[$field]=$this->input->get($field);
			//}
		}
		$this->db->insert($table,$input);
		if($this->db->insert_id()>0){echo "Insert ".$table." Success<br/>";}else{echo $this->db->last_query()."<br/>";}
	}
	
	public function singkron(){
		$this->load->view("singkron");
	}
	
	public function singkron_json(){
		$table = array("0"=>"absensi","grup","grup_guru","grup_siswa","jawaban","kelas_guru","kelas_sekolah","login","matpel_sekolah","sekolah","test","test_detail","user");
		$sekolah_id=$this->db->get("sekolah")->row()->sekolah_id;
		for($x=0;$x<count($table);$x++){
			unset($tablename);
			$where["sekolah_id"]=$sekolah_id;
			$isi=$this->db
			->get_where($table[$x],$where);	
			//echo $this->db->last_query();
			if($isi->num_rows()>0)
			{
				foreach($isi->result() as $isinya){	
					unset($fieldnya);	
					unset($rownya);
					foreach($this->db->list_fields($table[$x]) as $field)
					{
						$fieldnya[$field]=$isinya->$field;
						
					}	
					$rownya["row"][]=$fieldnya;	
					$datarow[]=$rownya;
				}
			}
			$tablename["sekolah_id"]=$sekolah_id;
			$tablename["table"]=$table[$x];
			$tablename["data"]=$datarow;
			$hasil[]=$tablename;
		}
		$data=json_encode($hasil);	
		$dataku["data"]=$data;
		$this->load->view("singkron",$dataku);
	}
		
	public function terima_semua_data(){
		$table=$this->input->post("table");
		$sekolah_id=$this->input->post("sekolah_id");
		$data=$this->input->post("data");
		
		
		 
		if(isset($HTTP_RAW_POST_DATA)) {
			parse_str($HTTP_RAW_POST_DATA,$arr); 
			echo $arr['data'];
		}
		else
		{
			echo $data;
		}
	
	}

	public function absensiswa(){
		
		$data["id"]=0;
		$data["name"]='';
		$data["number"]='';
		$data["type"]=0;
		$data["typename"]='';
		$data["datetime"]=date("d, M Y H:i:s");
		$data["url"]='';
		$data["success"]=0;
		$data["message"]="Tidak ada data!";
		
		if($_GET["type"]==1){$type="Masuk";}else{$type="Pulang";}
		$whereabsen["absen_date"]=date("Y-m-d");
		$whereabsen["absen_type"]=$_GET["type"];
		$whereabsen["absen_nisn"]=$_GET["nisn"];
		$absen=$this->db
		->join("user","user.user_id=absen.user_id","left")
		->join("telpon","telpon.user_id=user.user_id","left")
		->get_where("absen",$whereabsen);	
		// echo $this->db->last_query();
		if($absen->num_rows()==0)
		{
			$where["user_nisn"]=$_GET["nisn"];
			$user=$this->db
			->get_where("user",$where);	
			// echo $this->db->last_query();
			if($user->num_rows()>0)
			{
				foreach($user->result() as $user){					
					$input["absen_date"]=date("Y-m-d");			
					$input["absen_nisn"]=$user->user_nisn;			
					$input["user_id"]=$user->user_id;			
					$input["absen_remarks"]="Absen Barcode";			
					$input["sekolah_id"]=$this->session->userdata("sekolah_id");			
					$input["absen_status"]=1;	
					$input["absen_type"]=$_GET["type"];
					$this->db->insert("absen",$input);
					// echo $this->db->last_query();

					$data["success"]=1;
					$data["id"]=$user->user_id;
					$data["name"]=$user->user_name;
					$data["type"]=$_GET["type"];
					$data["typename"]=$type;
					$data["datetime"]=date("d, M Y H:i:s");
					$data["message"]="Absensi Anda Berhasil!";
					$data["url"]=base_url("api/qrcodesiswa?nisn=".$user->user_nisn);
				}
			}else{
				$data["success"]=0;
				$data["message"]="Data Siswa Tidak Ditemukan!";
			}
		}else{
			
			foreach ($absen->result() as $absen) {
				$data["success"]=1;
				$data["id"]=$absen->user_id;
				$data["name"]=$absen->user_name;
				$data["type"]=$_GET["type"];
				$data["typename"]=$type;
				$data["datetime"]=date("d, M Y H:i:s");
				$data["message"]="Absen berhasil!";
				$data["url"]=base_url("api/qrcodesiswa?nisn=".$absen->user_nisn);
			}
			
			$data["success"]=0;
			$data["message"]="Tidak memerlukan scan ulang!<br/>Anda sudah absen ".$type." hari ini!";
		}
		$this->djson($data);
	}

	public function qrcodesiswa(){
		require_once("phpqrcode/qrlib.php");
		$isi = $_GET["nisn"];  
        QRcode::png($isi); 
	}

	public function tableabsen(){
		?>
		<table class="table table-striped">
			<thead>
			<tr>
				<th>Sekolah</th>
				<th>Nama</th>
				<th>Kelas</th>
				<th>Absen</th>
			</tr>
			</thead>
			<tbody>
			<?php 
			$where["absen_date"]=date("Y-m-d");
			$absen=$this->db
			->join("user","user.user_id=absen.user_id","left")
			->join("kelas","kelas.kelas_id=user.kelas_id","left")
			->order_by("absen_datetime","desc")
			->get_where("absen",$where);
			// echo $this->db->last_query();
			foreach ($absen->result() as $absen) {
				if($absen->absen_type==1){$type="Masuk";}else{$type="Pulang";}
			?>
			<tr>
				<td><?=$absen->absen_datetime;?></td>
				<td><?=$absen->user_name;?></td>
				<td><?=$absen->kelas_name;?></td>
				<td><?=$type;?></td>
			</tr>	
			<?php }?>		
			</tbody>
		</table>
		<?php
	}

	public function cektelpon(){
		$message=$_GET["message"];
		$number=$_GET["number"];
		$server=$_GET["server"];
		$id=$_GET["id"];

		$data=array();

		$where["user_id"]=$id;
		$telpon=$this->db
		->get_where("telpon",$where);	
		foreach ($telpon->result() as $telpon) {
			$data1["message"]=$message."[".$telpon->telpon_id."]";
			$data1["number"]=$telpon->telpon_number;
			$data1["server"]=$server;
			$data[]=$data1;
		}
		$this->djson($data);
	}
	
	private function djson($value=array()) {
		$json = json_encode($value);
		$this->output->set_header("Access-Control-Allow-Origin: *");
		$this->output->set_header("Access-Control-Expose-Headers: Access-Control-Allow-Origin");
		$this->output->set_status_header(200);
		$this->output->set_content_type('application/json');
		$this->output->set_output($json);
	}
	
	/*
	function send_gcm_notify($reg_id, $title, $message, $img_url, $tag) {
		define("GOOGLE_API_KEY", "AIzaSyDbabv_NlcyoxwaOedLjlimcZS9drjA5uE");
		define("GOOGLE_GCM_URL", "https://fcm.googleapis.com/fcm/send");
	
        $fields = array(
			'to'  						=> $reg_id ,
			'priority'					=> "high",
            'notification'              => array( "title" => $title, "body" => $message, "tag" => $tag ),
			'data'						=> array("message" =>$message, "image"=> $img_url),
        );
		
        $headers = array(
			GOOGLE_GCM_URL,
			'Content-Type: application/json',
            'Authorization: key=' . GOOGLE_API_KEY 
        );
		
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, GOOGLE_GCM_URL);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
		
        $result = curl_exec($ch);
        if ($result === FALSE) {
            die('Problem occurred: ' . curl_error($ch));
        }
		
        curl_close($ch);
        echo $result;
    }	
	
	public function sendMessage($data,$target){
		//FCM api URL
		$url = 'https://fcm.googleapis.com/fcm/send';
		//api_key available in Firebase Console -> Project Settings -> CLOUD MESSAGING -> Server key
		$server_key = 'AIzaSyANqvKPEr9XQ5-bXTS9m93DYMLwBCY5_Yc';
					
		$fields = array();
		$fields['data'] = $data;
		if(is_array($target)){
			$fields['registration_ids'] = $target;
		}else{
			$fields['to'] = $target;
		}
		//header with content_type api key
		$headers = array(
			'Content-Type:application/json',
		  'Authorization:key='.$server_key
		);
					
		$ch = curl_init();
		curl_setopt($ch, CURLOPT_URL, $url);
		curl_setopt($ch, CURLOPT_POST, true);
		curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
		curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
		curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fields));
		$result = curl_exec($ch);
		if ($result === FALSE) {
			die('FCM Send Error: ' . curl_error($ch));
		}
		curl_close($ch);
		return $result;
	}
	
	function send_android_notification($registration_ids, $message) {
		$fields = array(
		'registration_ids' => array($registration_ids),
		'data'=> $message,
		);
		$headers = array(
		'Authorization: key=AIzaSyANqvKPEr9XQ5-bXTS9m93DYMLwBCY5_Yc', // FIREBASE_API_KEY_FOR_ANDROID_NOTIFICATION
		'Content-Type: application/json'
		);
		// Open connection
		$ch = curl_init();
		 
		// Set the url, number of POST vars, POST data
		curl_setopt( $ch,CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send' );
		curl_setopt( $ch,CURLOPT_POST, true );
		curl_setopt( $ch,CURLOPT_HTTPHEADER, $headers );
		curl_setopt( $ch,CURLOPT_RETURNTRANSFER, true );
		 
		// Disabling SSL Certificate support temporarly
		curl_setopt( $ch,CURLOPT_SSL_VERIFYPEER, false );
		curl_setopt( $ch,CURLOPT_POSTFIELDS, json_encode( $fields ) );
		 
		// Execute post
		$result = curl_exec($ch );
		if($result === false){
		die('Curl failed:' .curl_errno($ch));
		}
		 
		// Close connection
		curl_close( $ch );
		return $result;
		}
	*/	
		
	

	
	
}