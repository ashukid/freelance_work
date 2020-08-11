<?php

	session_start();
	$ip_add = getenv("REMOTE_ADDR");
	include "db.php";

	$user_id = -1;


	$category_query = "SELECT p_id,user_id FROM cart";
	$run_query = mysqli_query($con,$category_query) or die(mysqli_error($con));

	$dict=array();
	$userdict=array();
	while($row = mysqli_fetch_array($run_query)){
			
			$pid=$row["p_id"];
			$userid=$row["user_id"];
			if(!($userid == $user_id)){
				if(array_key_exists($userid,$dict)){
					array_push($dict[$userid],$pid);
				}
				else{
					$dict[$userid]=array();
					array_push($dict[$userid],$pid);
				}
			}else{
				array_push($userdict,$pid);
			}
		}

	$count=array();
	foreach($dict as $key => $value) {
		$result=count(array_intersect($value,$userdict));
		$count[$key]=$result;
	}

	# sort according to number of common items
	arsort($count);

	$products=array();
	foreach($count as $key => $value){

		$result=array_diff($dict[$key],$userdict);
		foreach($result as $item){
			array_push($products,$item);
		}
		if(count($products)>=5){
			break;
		}
	}
	
	$recommend_products=array_slice($products, 0,5);

	

	$query = "SELECT * FROM products where product_id in (".implode(',',$recommend_products).")";
	$run_query = mysqli_query($con,$query) or die(mysqli_error($con));

	if(mysqli_num_rows($run_query) > 0){
		while($row = mysqli_fetch_array($run_query)){
			$pro_id    = $row['product_id'];
			$pro_cat   = $row['product_cat'];
			$pro_brand = $row['product_brand'];
			$pro_title = $row['product_title'];
			$pro_price = $row['product_price'];
			$pro_image = $row['product_image'];
			$pro_desc = $row['product_desc'];

			echo "
					<div class='col-md-4'>
								<div class='panel panel-info'>
									<div class='panel-heading'>$pro_title</div>
									<div class='panel-body'>
										<img src='product_images/$pro_image' style='width:160px; height:250px;'/>
									</div>
									<div class='panel-heading'>RM.$pro_price.00
										<div>$pro_desc</div>
										<button pid='$pro_id' style='float:right;' id='product' class='btn btn-danger btn-xs'>AddToCart</button>
									</div>
								</div>
							</div>	
				";
		}
	}

?>