<?php
  include('includes/conectar.php');
  if ($_GET['create'] && $_GET['itemId']){
    if ($_POST['qt']==""){
      $qt="NULL";
    } else {
      $qt=$_POST['qt'];
    }
    $sql="INSERT INTO `request` (`id`, `requestDate`, `arrived`, `idItem`, `quantity`) VALUES (NULL, CURRENT_TIMESTAMP, NULL, '".$_GET['itemId']."', ".$qt.");";
echo $sql;
    if (mysqli_query($con, $sql)) {
    } else {
      echo "Error updating record: " . mysqli_error($con);
    }
  }
  if ($_POST['arrived'] && $_POST['arrived_action']){
    $sql="UPDATE `request` SET `arrived` = CURRENT_TIMESTAMP WHERE `request`.`id` = ".$_POST['arrived_action'].";";
    if (mysqli_query($con, $sql)) {
    } else {
      echo "Error updating record: " . mysqli_error($con);
    }
    $sql = "INSERT INTO `movement` (`id`, `idItem`, `quantity`, `idRequest`, `timestamp`) VALUES (NULL, '".$_POST['itemId']."', '".$_POST['arrived']."', ".$_POST['rq'].", CURRENT_TIMESTAMP);";
    if (mysqli_query($con, $sql)) {
    } else {
      echo "Error updating record: " . mysqli_error($con);
    }
  }
  include('includes/alt.php');
  $sql = "SELECT `id`, `requestDate`, `arrived`, `idItem`, `quantity` FROM `request` ORDER BY `request`.`requestDate` DESC";
  $quer=mysqli_query($con,$sql);
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
          <?php if($_GET['arrived']){?>
            <div class="alert alert-info alert-dismissible">
              <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
              <h4><i class="icon fa fa-info"></i> Validate</h4>
              Validate the arrival of <?php echo $_GET['name'];?>. Increment the next value of elements to Stock:
              <form action="./request.php" method="post">
                <input type="number" class="form-control" name="arrived" value="<?php if ($_GET['quantity'] == 0) {echo 0;} else {echo $_GET['quantity'];}?>" autofocus>
                <input type="hidden" name="arrived_action" value="<?php echo $_GET['arrived'];?>">
                <input type="hidden" name="itemId" value="<?php echo $_GET['itemId'];?>">
                <input type="hidden" name="rq" value="<?php echo $_GET['rq'];?>">
              </form>
            </div>
          <?php }?>


              <div class="box">
                <div class="box-header">
                  <h3 class="box-title">Requests</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                  <table id="example2" class="table table-bordered table-striped">
                    <thead>
                    <tr>
                      <th>Item Name</th>
                      <th>Quantity</th>
                      <th>Request Date</th>
                      <th>Arrived</th>
                      <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                      <?php while($resul = mysqli_fetch_assoc($quer)) {
                        //`id`, `requestDate`, `arrived`, `idItem`, `quantity`
                        $resulIdRequest=$resul['id'];
                        $resulDate=$resul['requestDate'];
                        $resulArrived=$resul['arrived'];
                        $resulIdItem=$resul['idItem'];
                        $resulQuantity=$resul['quantity'];

                        $sql = "SELECT `name` FROM `item` WHERE `id` = ".$resulIdItem." LIMIT 1";
                        $quer2=mysqli_query($con,$sql);
                        $resulName = mysqli_fetch_assoc($quer2);
                        ?>
                            <tr>
                              <td><a target="item" href="item.php?id=<?php echo sprintf('%04d', $resulIdItem);?>"><?php echo $resulName['name']; ?></a></td>
                              <td><?php echo $resulQuantity;?></td>
                              <td><?php echo $resulDate;?></td>
                              <td><?php echo $resulArrived;?></td>
                              <td><?php if (!$resulArrived){ ?><a href="./request.php?arrived=<?php echo $resulIdRequest;?>&amp;quantity=<?php echo $resulQuantity;?>&amp;name=<?php echo $resulName['name'];?>&amp;itemId=<?php echo $resulIdItem;?>&amp;rq=<?php echo $resulIdRequest;?>">Arrived</a><?php }?></td>
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
<?php
mysqli_close($con);
include('includes/bottom.php');?>
