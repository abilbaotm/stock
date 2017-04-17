<?php include('includes/alt.php');
include('includes/conectar.php');

  if (isset ($_POST['stock'])) {
    $sql = "INSERT INTO `movement` (`id`, `idItem`, `quantity`, `idRequest`, `timestamp`) VALUES (NULL, '".$_GET['id']."', '".$_POST['stock']."', NULL, CURRENT_TIMESTAMP);";
    mysqli_query($con,$sql);
  }





  $sql = "SELECT `id`, `name`, `barcode`, `stock`, `alerta` FROM `item` WHERE `id` = ".$_GET['id']." LIMIT 1";
  $quer=mysqli_query($con,$sql);
  $resul = mysqli_fetch_assoc($quer);
    $productoID=$resul['id'];
    $productoName=$resul['name'];
    $productoBarcode=$resul['barcode'];
    $productoStock=$resul['stock'];
    $productoAlert=$resul['alerta'];



  $sql = "SELECT `quantity`, `idRequest`, `timestamp` FROM `movement` WHERE `idItem` = ".$_GET['id']." ORDER BY timestamp ASC";
  $querStock=mysqli_query($con,$sql);


?>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Home</li>
        <li><a href=".">Dashboard</a></li>
        <li class="active">Item</li>
      </ol>
    </section>
    <section class="content">
	<div class="col-md-6">
		<div class="box color-palette-box">
			<div class="box-header">
				<h3 class="box-title">Info</h3>
			</div>
			<div class="row">
				<dl class="dl-horizontal">
            <dt>Name</dt>
            <dd><?php echo $productoName;?></dd>
            <dt>Stock</dt>
            <dd><?php echo $productoStock;?></dd>
            <dt>Stock Alert</dt>
            <dd><?php echo $productoAlert;?></dd>
        </dl>
			</div>
		</div>
	</div>
  <div class="col-md-6">
    <div class="box color-palette-box">
      <div class="box-header">
        <h3 class="box-title">Actions</h3>
      </div>
      <div class="row">
        <div class="box-body">
          <div class="col-sm-12">
            <form action="item.php?id=<?php echo $_GET['id'];?>" method="POST">
              <div class="input-group">
                <span class="input-group-addon">#</span>
                <input type="number" class="form-control" value=-1 name="stock" autofocus>
              </div>
          </form>
          </div>
        </div>
      </div>
    </div>
  </div>
	<div class="col-md-12">
		<div class="box color-palette-box">
			<div class="box-header">
				<h3 class="box-title">Timeline</h3>
			</div>

              <!-- /.box-header -->
              <div class="box-body">
                <table id="example2" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>Timestamp</th>
                    <th>Request</th>
                    <th>Quantity</th>
                  </tr>
                  </thead>
                  <tbody>
                    <?php   while ($resulStock = mysqli_fetch_assoc($querStock)) {?>
                        <tr>
                          <td><?php echo $resulStock['timestamp']; ?></td>
                          <td><?php echo $resulStock['idRequest']; ?></td>
                          <td><?php echo $resulStock['quantity']; ?></td>
                        </tr>
                    <?php  }; ?>

                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Timestamp</th>
                    <th>Request</th>
                    <th>Quantity</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->

	</div>
	</section>
  </div>
<?php include('includes/bottom.php');?>
