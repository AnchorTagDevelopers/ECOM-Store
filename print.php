<?php
include ('vendor/autoload.php');
require('connection.inc.php');
require('functions.inc.php');
if(!isset($_SESSION['USER_ID'])){
	die();
}


$order_id=get_safe_value($con,$_GET['id']);
$css=file_get_contents('css/bootstrap.min.css');
$css.=file_get_contents('style.css');

$html='
<div class="wishlist-table table-responsive">
   <table>
      <thead>
         <tr>
            <th class="product-thumbnail">Product Name</th>
            <th class="product-name"><span class="nobr">Product Image</span></th>
            <th class="product-price"><span class="nobr"> Qty </span></th>
            <th class="product-stock-stauts"><span class="nobr"> Price </span></th>
            <th class="product-stock-stauts"><span class="nobr"> Total Price </span></th>
         </tr>
      </thead>
      <tbody>';
	   
		$uid=$_SESSION['USER_ID'];
		$res=mysqli_query($con, "select distinct(order_detail.id), order_detail.*, product.name, product.image from order_detail, product, myorder where order_detail.order_id='$order_id' and myorder.user_id='$uid' and product.id=order_detail.product_id");    
		$total_price=0;
		if(mysqli_num_rows($res)==0){
			die();
		}
		while($row=mysqli_fetch_assoc($res)){
		$total_price=$total_price+($row['qty']*$row['price']);
		$pp=$row['qty']*$row['price'];
		
         $html.='<tr>
            <td class="product-name">'.$row['name'].'</td>
            <td class="product-thumbnail"><a href="#"><img src="'.PRODUCT_IMAGE_SITE_PATH.$row['image'].'"></a></td>
            <td class="product-name">'.$row['qty'].'</td>
            <td class="product-name">'.$row['price'].'</td>
            <td class="product-name">'.$pp.'</td>
         </tr>';
		}
         $html.='<tr>
					<td colspan="3"></td>
					<td class="product-name">Total Price</td>
					<td class="product-name">'. $total_price.'</td>
				</tr>';
		$html.='
      </tbody>
   </table>
</div>';

$mpdf= new \Mpdf\Mpdf();
$mpdf->WriteHTML($css, 1);
$mpdf->WriteHTML($html, 2);
$file=time().'.pdf';
$mpdf->Output($file,'D');



?>