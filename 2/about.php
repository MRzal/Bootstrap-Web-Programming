<?php

session_start();
include "../koneksi.php";
include "auth_user.php";
?>
<!DOCTYPE html>
<html>
 <head>
    <meta charset="utf-8">
    <title>Sistem Akademik</title>
	<!-- Library CSS -->
	<style type="text/css">
	body,td,th {
	font-family: "Source Sans Pro", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
h1,h2,h3,h4,h5,h6 {
	font-family: "Source Sans Pro", sans-serif;
}
h1 {
	color: #2CC115;
}
    </style>
	<?php
		include "bundle_css.php";
	?>
  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
      <?php
        include 'content_header.php';
       ?>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- Sidebar user panel -->
          <div class="user-panel">
            <div class="pull-left image">
              <p></p>
            </div>
          </div><!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
				<li class="header"><h4><b><center  style="font-size: 18px; font-family: 'Source Sans Pro', sans-serif;">Menu Panel</center></b></h4></li>
					<li><a href="index.php"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
					<li><a href="jadwal.php"><i class="fa fa-calendar"></i><span>Jadwal</span></a></li>
					<li><a href="nilai.php"><i class="fa fa-book"></i><span>Nilai Siswa</span></a></li>
					<li class="active"><a href="about.php"><i class="fa fa-info-circle"></i><span>Tentang Aplikasi</span></a></li>
          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1 style="color: #2CC115">
            Tentang Aplikasi
          </h1>
          <ol class="breadcrumb">
            <li><i class="fa fa-info-circle"></i> Tentang Aplikasi</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          <div class="row">
            <div class="col-xs-12">
              <div class="box">
                <div class="box-header">
				<h1><center><b>Sistem</b></center></h1>
					<center><img src="../aset/foto/ids.jpg" width="225" height="225" /></center>
				  <center>
				    <h2><b> <span style="color: #2CC115; font-size: 36px;">Database Informasi Akademik</span></b></h2></center>
                </div><!-- /.box-header -->
                <div class="box-body">
					
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div><!-- /.col -->
          </div><!-- /.row -->
        </section><!-- /.content -->
		
    </div><!-- /.content-wrapper -->
	<?php
		include	"content_footer.php";
	?>
    </div><!-- ./wrapper -->
	<!-- Library Scripts -->
	<?php
		include "bundle_script.php";
	?>
  </body>
</html>
