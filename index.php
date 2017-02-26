<?php include('includes/alt.php');
  $sql = "SELECT `id`, `name`, `barcode`, `stock` FROM `item` ORDER BY name DESC";
  include('includes/conectar.php');
  $quer=mysqli_query($con,$sql);
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
              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Data Table With Full Features</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <table id="example1" class="table table-bordered table-striped">
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
