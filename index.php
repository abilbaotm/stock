<?php include('includes/alt.php');
  include('includes/conectar.php');
  $sql = "SELECT `id`, `name`, `barcode`, `stock`, `alerta` FROM `item` ORDER BY name DESC";
  $quer=mysqli_query($con,$sql);
  //
  $sql = "SELECT count(`id`) cuenta FROM `item` WHERE `stock` < `alerta`";
  $querAlert=mysqli_query($con,$sql);
  $resul = mysqli_fetch_assoc($querAlert);
  $numStockAlerts=$resul['cuenta'];

  $sql = "SELECT count(`id`) cuenta FROM `item`";
  $querAlert=mysqli_query($con,$sql);
  $resul = mysqli_fetch_assoc($querAlert);
  $numStockTotal=$resul['cuenta'];
  mysqli_close($con);
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
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>
    <section class="content">
      <div class="row">
        <div class="col-xs-12">


          <?php if ($numStockAlerts > 0){ ?>
            <style>
            .info-box-content { margin-left: 0px;}</style>
          <div class="info-box bg-red">

            <div class="info-box-content">
              <span class="info-box-text">There are elemts in Stock alert</span>
              <span class="info-box-number"><?php echo $numStockAlerts; ?> / <?php echo $numStockTotal; ?> </span>

              <div class="progress">
                <div class="progress-bar" style="width: <?php echo $numStockAlerts*100/$numStockTotal ;?>%"></div>
              </div>
                  <span class="progress-description">
                    <a href="stock_alerts.php">View elemets</a>
                  </span>
            </div>
            <!-- /.info-box-content -->
          </div>
          <?php } ?>

              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Main Stock</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <table id="example2" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                      <th>ID</th>
                      <th>Name</th>
                      <th>barcode</th>
                      <th>Stock</th>
                    </tr>
                    </thead>
                    <tbody>
                      <?php while($resul = mysqli_fetch_assoc($quer)) {
                        $resulID=$resul['id'];
                        $resulNombre=$resul['name'];
                        $resulBarcode=$resul['barcode'];
                        $resulStock=$resul['stock'];
                        ?>
                            <tr>
                              <td><a target="item" href="item.php?id=<?php echo sprintf('%04d', $resulID);?>"><?php echo "ERINV".sprintf('%04d', $resulID);?></a></td>
                              <td><?php echo $resulNombre;?></td>
                              <td><?php echo $resulBarcode;?></td>
                              <td><?php echo $resulStock;?></td>
                            </tr>
                      <?php } ?>
                    </tfoot>
                  </table>
                </div>
                <!-- /.box-body -->
              </div>
            </div>
              </div>
            </section>
  </div>
<?php include('includes/bottom.php');?>
