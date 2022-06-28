<?php require ('top.php'); 
$order_id=get_safe_value($con,$_GET['id']);

?>

<div class="wishlist-area ptb--100 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <div class="wishlist-content">
                            <form action="#">
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
                                        <tbody>
                                            <?php

                                            $uid=$_SESSION['USER_ID'];
                                            $res=mysqli_query($con, "select distinct(order_detail.id), order_detail.*, product.name, product.image from order_detail, product, myorder where order_detail.order_id='$order_id' and myorder.user_id='$uid' and product.id=order_detail.product_id");    
                                            $total_price=0;
                                            while($row=mysqli_fetch_assoc($res)){
                                                
                                                $total_price=$total_price+($row['qty']*$row['price']);
                                                
                                                ?>
                                            

                                            
                                            <tr>
                                                <td class="product-name"><?php echo $row['name'] ?></td>
                                                <td class="product-thumbnail"><a href="#"><img src="<?php echo PRODUCT_IMAGE_SITE_PATH.$row['image']?>"></a></td>
                                                <td class="product-name"><?php echo $row['qty'] ?></td>
                                                <td class="product-name"><?php echo $row['price'] ?></td>
                                                <td class="product-name"><?php echo $row['qty']*$row['price']  ?></td>
                                                 
                                            </tr>
                                            <?php } ?>
                                            <tr>
                                                
                                                <td colspan="3"></td>
                                                <td class="product-name">Total Price</td>
                                                <td class="product-name"><?php echo  $total_price  ?></td>
                                                 
                                            </tr>
                                        </tbody>
                                      
                                    </table>
                                </div>  
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<?php require ('footer.php'); ?>