<!DOCTYPE html>
<html>
<head>
<?php require_once("meta.php");?>
<style>
.bigger{font-size:14px !important;}
</style>
</head>

<body class="no-skin">
<?php require_once("header.php");?>
	


    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Dashboard</li>
                </ul><!-- /.breadcrumb -->                
            </div>

            <div class="page-content">

                <div class="page-header">
                    <h1>
                        Dashboard
                    </h1>
                </div><!-- /.page-header -->

                <div class="row">
                    <div class="col-xs-12">
                        <div class="alert alert-block alert-success">
                            <button type="button" class="close" data-dismiss="alert">
                                <i class="ace-icon fa fa-times"></i>
                            </button>

                            <i class="ace-icon fa fa-star"></i>

                            Welcome 
                                <?=$this->session->userdata("user_name");?> to
                            <strong class="green"> Smart School's System
                                <small>(v0.1)</small>
                            </strong> [&copy; <?=date("Y");?>].
                        </div>
                        <div class="alert alert-block alert-success row">
                            <div class="col-md-4">
                                <a href="<?=base_url("absen?type=1&color=green;");?>" class="btn btn-block btn-success">
                                    Absensi Masuk
                                </a>   
                            </div> 
                            <div class="col-md-4">                        
                                <a href="<?=base_url("absen?type=2&color=orange;");?>" class="btn btn-block btn-warning">
                                    Absensi Keluar
                                </a>   
                            </div>   
                            <div class="col-md-4">                        
                                <a href="<?=base_url("pelunasanwa?color=blue;");?>" class="btn btn-block btn-primary">
                                    Alert Pelunasan
                                </a>   
                            </div>                            
                        </div>
                        <div class="row">
                            <div class="space-6"></div>
                            <div class="col-sm-7 infobox-container">
                                <div class="infobox infobox-blue">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-twitter"></i>
                                    </div>
                                    <div class="infobox-data">
                                        <span class="infobox-data-number">
										<?php
										if($this->session->userdata("sekolah_id")>0){
											$this->db->where("sekolah_id",$this->session->userdata("sekolah_id"));
										}
										$sekolah = $this->db->get("sekolah")->num_rows();
										echo $sekolah;
										?>
										</span>
                                        <div class="infobox-content">Schools</div>
                                    </div>
                                </div>								
                                <div class="infobox infobox-green">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-comments"></i>
                                    </div>
                                    <div class="infobox-data">
                                        <span class="infobox-data-number">
										<?php
										if($this->session->userdata("sekolah_id")>0){
											$this->db->where("sekolah_id",$this->session->userdata("sekolah_id"));
										}
										$grup = $this->db->get("grup")->num_rows();
										echo $grup;
										?>
										</span>
                                        <div class="infobox-content">Groups</div>
                                    </div>
                                </div>
                                <div class="infobox infobox-red">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-flask"></i>
                                    </div>
                                    <div class="infobox-data">
                                        <span class="infobox-data-number">
										<?php
										if($this->session->userdata("sekolah_id")>0){
											$this->db->where("sekolah_id",$this->session->userdata("sekolah_id"));
										}
										$materi = $this->db->get("materi")->num_rows();
										echo $materi;
										?>
										</span>
                                        <div class="infobox-content">Lessons</div>
                                    </div>
                                </div>
                                <div class="infobox infobox-orange2">
                                    <div class="infobox-icon">
                                        <i class="ace-icon fa fa-flask"></i>
                                    </div>
                                    <div class="infobox-data">
                                        <span class="infobox-data-number">
										<?php
										if($this->session->userdata("sekolah_id")>0){
											$this->db->where("sekolah_id",$this->session->userdata("sekolah_id"));
										}
										$test = $this->db
										->group_by("materi_id")
										->get("test")->num_rows();
										echo $test;
										?>
										</span>
                                        <div class="infobox-content">Tests</div>
                                    </div>
                                    <div class="badge badge-success">
										<?php
										if($materi==0){$materi=1;}
										$persentest=$test/$materi*100;
										echo round($persentest)." %";
										?> from lesson
                                    </div>
                                </div>
                                <div class="space-6"></div>
                                <div class="infobox infobox-green infobox-small infobox-dark">
                                    <div class="infobox-progress">
                                        <div class="easy-pie-chart percentage" data-percent="61" data-size="39">
                                            <span class="percent">
											<?php 
											//cek jml siswa
											$jml=$this->db
											->where("sekolah_id",$this->session->userdata("sekolah_id"))
											->where("position_id","4")
											->get("user")
											->num_rows();
											$absen=$this->db
											->where("absensi_date",date("Y-m-d"))
											->where("sekolah_id",$this->session->userdata("sekolah_id"))
											->get("absensi")
											->num_rows();
											
											if($jml==0){$jml=1;}
											//echo $this->db->last_query();
											echo $absen/$jml*100;
											?>
											</span>%
                                        </div>
                                    </div>

                                    <div class="infobox-data">
                                        <div class="infobox-content">Attendance</div>
                                        <div class="infobox-content"><?=date("d M y");?></div>
                                    </div>
                                </div>
                            </div>
                            <div class="vspace-12-sm"></div>
                            <div class="col-sm-5">
                                <div class="widget-box">
                                    <div class="widget-header widget-header-flat widget-header-small">
                                        <h5 class="widget-title">
                                            <i class="ace-icon fa fa-signal"></i>
                                            Number of logins
                                        </h5>
                                        <div class="widget-toolbar no-border">
                                            <div class="inline dropdown-hover">
                                                <button class="btn btn-minier btn-primary">
                                                    This day
                                                </button>

                                                
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <div id="piechart-placeholder"></div>
                                            <div class="hr hr8 hr-double"></div>
                                            <div class="clearfix">
												<?php $jmllogin=$this->db
												->where("sekolah_id",$this->session->userdata("sekolah_id"))
												->where("login_date",date("Y-m-d"))
												->get("login");
												if($jmllogin->num_rows()>0){
													$login_siswa=$jmllogin->row()->login_siswa;
													$login_guru=$jmllogin->row()->login_guru;
													$login_admin=$jmllogin->row()->login_admin;
												}else{
													$login_siswa=0;
													$login_guru=0;
													$login_admin=0;
												}
												?>
                                                <div class="grid3">
                                                    <span class="grey">
                                                        <i class="ace-icon fa fa-grav fa-2x blue"></i>
                                                        &nbsp; Student
                                                    </span>
                                                    <h4 class="bigger pull-right"><?=number_format($login_siswa,0,",",".");?></h4>
                                                </div>

                                                <div class="grid3">
                                                    <span class="grey">
                                                        <i class="ace-icon fa fa-blind fa-2x purple"></i>
                                                        &nbsp; Teacher
                                                    </span>
                                                    <h4 class="bigger pull-right"><?=number_format($login_guru,0,",",".");?></h4>
                                                </div>

                                                <div class="grid3">
                                                    <span class="grey">
                                                        <i class="ace-icon fa fa-user-secret fa-2x red"></i>
                                                        &nbsp; Admin
                                                    </span>
                                                    <h4 class="bigger pull-right"><?=number_format($login_admin,0,",",".");?></h4>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>	
                    </div>                    
                    <div class="col-md-7 well">
                        <form method="post">
                            <div class="form-group">
                                <label for="sekolah_notifabsen">Jam kirim notifikasi tidak masuk sekolah.</label>
                                <input type="time" class="form-control" id="sekolah_notifabsen" name="sekolah_notifabsen" value="<?=$sekolah_notifabsen;?>">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    

  

<?php require_once("footer.php");?>	
</body>

</html>
