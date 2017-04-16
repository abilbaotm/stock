<?php
  if ($_POST['name'] && $_POST['alert']){
      include('includes/conectar.php');
      $sql = "INSERT INTO `item` (`id`, `name`, `barcode`, `stock`, `alerta`) VALUES (NULL, '".$_POST['name']."', NULL, '0', '".$_POST['alert']."');";
      $quer=mysqli_query($con,$sql);
      header("Location: ./item.php?id=".mysqli_insert_id($con));
      mysqli_close($con);
    }
  include('includes/alt.php');

?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Create new element</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
    <section class="content">
      <div class="box box-warning">
            <div class="box-header with-border">
              <h3 class="box-title">General Elements</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <form role="form" action="" method="post">
                <!-- text input -->
                <div class="form-group">
                  <label>Name</label>
                  <input name="name" type="text" class="form-control" placeholder="Enter ..." autofocus>
                  <label>Minimun Stock/Stock alert</label>
                  <input name="alert" type="number" class="form-control" placeholder="Enter ..." value="10">
                  <input type="submit" value="Submit">
                </div>
              </form>
            </div>
            <!-- /.box-body -->
          </div>
      </section>
  </div>
  <script>
    $(function () {
      $('#example2').DataTable({
        "paging": true,
        "lengthChange": false,
        "searching": false,
        "ordering": true,
        "info": true,
        "autoWidth": false
      });
    });
  </script>
<?php include('includes/bottom.php');?>
