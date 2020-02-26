<?php
include "db.php";

if(isset($_POST["category"])){
  $category_query = "SELECT * FROM categories";
  $run_query = mysqli_query($con, $category_query) or die(mysqli_error($con));

  echo "
  <h5 class='bg-info p-3 text-light'>Categories</h5>
  <ul class='nav flex-column'>
  ";
  if(mysqli_num_rows($run_query) > 0){
    while($row = mysqli_fetch_array($run_query)){
      $cid = $row["cat_id"];
      $cat_name = $row["cat_title"];
      echo "
      <li><a class='nav-link category' href='#' cid='$cid'>$cat_name</a></li>
      ";
    }
    echo "</ul>";
  }
}

if(isset($_POST["brand"])){
  $category_query = "SELECT * FROM brand";
  $run_query = mysqli_query($con, $category_query) or die(mysqli_error($con));

  echo "
  <h5 class='bg-info p-3 text-light'>Brand</h5>
  <ul class='nav flex-column'>
  ";
  if(mysqli_num_rows($run_query) > 0){
    while($row = mysqli_fetch_array($run_query)){
      $brand_id = $row["brand_id"];
      $brand_name = $row["brand_title"];
      echo "
      <li><a class='nav-link selectBrand' href='#' bid='$brand_id'>$brand_name</a></li>
      ";
    }
    echo "</ul>";
  }
}


if(isset($_POST["page"])){
  $sql = "SELECT * FROM products";
  $run_query = mysqli_query($con, $sql);
  $count = mysqli_num_rows($run_query);

  echo "
  <nav aria-label='...'>
    <ul class='pagination justify-content-center'>
      <li class='page-item disabled'>
        <a class='page-link' href='#' tabindex='-1'>Previous</a>
      </li>
  ";
  $pageno = ceil($count/9);
  for($i=1; $i<=$pageno; $i++){
    echo "
    <li class='page-item'>
      <a class='page-link' href='#' page='$i' id='page'>$i</a>
    </li>

    ";
  }

  echo "
  <li class='page-item'>
    <a class='page-link' href='#'>Next</a>
  </li>
</ul>
</nav>
  ";
}



if(isset($_POST["getProduct"])){
  $limit = 9;
  if(isset($_POST["setPage"])){
    $pageno = $_POST["pageNumber"];
    $start = ($pageno * $limit) - $limit;
  }else{
    $start = 0;
  }
  $product_query = "SELECT * FROM products LIMIT $start, $limit";
  $run_query = mysqli_query($con, $product_query);

  if(mysqli_num_rows($run_query) > 0){
    while($row = mysqli_fetch_array($run_query)){
      $pro_id = $row["product_id"];
      $pro_cat = $row["product_cat"];
      $pro_brand = $row["product_brand"];
      $pro_title = $row["product_title"];
      $pro_desc = $row["product_desc"];
      $pro_price = $row["product_price"];
      $pro_image = $row["product_image"];
      echo "
      <div class='col-md-4 mb-3'>
        <div class='card border-info'>
          <div class='card-body text-secondary text-center p-0'>
            <img class='img-fluid' alt='Images' src='images/product/$pro_image'/>
            <div class='p-3'>
              <span class='font-weight-bold'>____________</span>
              <p class='card-text pt-2'>$pro_desc</p>
              <h5 class='card-title mb-0'>$pro_title</h5>
            </div>
          </div>
          <div class='card-header text-info'><span class='float-left font-weight-bold mt-2'>BDT-$pro_price </span><span class='float-right'><button pid='$pro_id' class='btn btn-outline-info'>Add to Cart</button></span></p></div>
        </div>
      </div>
      ";
    }
  }
}

if(isset($_POST["get_selected_category"]) || isset($_POST["selectBrand"]) || isset($_POST["search"])) {
    if(isset($_POST["get_selected_category"])){
        $id = $_POST["cat_id"];
        $sql = "SELECT * FROM products WHERE product_cat = '$id'";
    }elseif (isset($_POST["selectBrand"])) {
      $id = $_POST["brand_id"];
      $sql = "SELECT * FROM products WHERE product_brand = '$id'";
    }else {
      $keyword = $_POST["product_keyword"];
      $sql = "SELECT * FROM products WHERE product_keyword LIKE '%$keyword%'";
    }

    $run_query = mysqli_query($con, $sql);
    while($row = mysqli_fetch_array($run_query)){
      $pro_id = $row["product_id"];
      $pro_cat = $row["product_cat"];
      $pro_brand = $row["product_brand"];
      $pro_title = $row["product_title"];
      $pro_desc = $row["product_desc"];
      $pro_price = $row["product_price"];
      $pro_image = $row["product_image"];
      $pro_keyword = $row["product_keyword"];
      echo "
      <div class='col-md-4 mb-3'>
        <div class='card border-info'>
          <div class='card-body text-secondary text-center p-0'>
            <img class='img-fluid' alt='Images' src='images/product/$pro_image'/>
            <div class='p-3'>
              <span class='font-weight-bold'>____________</span>
              <p class='card-text pt-2'>$pro_desc</p>
              <h5 class='card-title mb-0'>$pro_title</h5>
            </div>
          </div>
          <div class='card-header text-info'><span class='float-left font-weight-bold mt-2'>BDT-$pro_price </span><span class='float-right'><button pid='$pro_id' class='btn btn-outline-info'>Add to Cart</button></span></p></div>
        </div>
      </div>
      ";
    }
}





//Product upload into database
$msg = "";
$msg_class = "";
if (isset($_POST['add_product'])) {
  // for the database
  $product_title = stripslashes($_POST['product_title']);
  $product_desc = stripslashes($_POST['product_desc']);
  $product_price = stripslashes($_POST['product_price']);
  $productImageName = time() . '-' . $_FILES["productImage"]["name"];
  // For image upload
  $target_dir = "images/product/";
  $target_file = $target_dir . basename($productImageName);
  // VALIDATION
  // validate image size. Size is calculated in Bytes
  if($_FILES['productImage']['size'] > 900000) {
    $msg = "Image size should not be greated than 900Kb";
    $msg_class = "alert-danger";
  }
  // check if file exists
  if(file_exists($target_file)) {
    $msg = "File already exists";
    $msg_class = "alert-danger";
  }
  // Upload image only if no errors
  if (empty($error)) {
    if(move_uploaded_file($_FILES["productImage"]["tmp_name"], $target_file)) {
      $sql = "INSERT INTO products SET product_image='$productImageName', product_title='$product_title', product_desc='$product_desc', product_price='$product_price'";
      if(mysqli_query($con, $sql)){
        $msg = "Product uploaded";
        $msg_class = "alert-success";
      } else {
        $msg = "There was an error in the database";
        $msg_class = "alert-danger";
      }
    } else {
      $error = "There was an erro uploading the file";
      $msg = "alert-danger";
    }
  }
}



?>
