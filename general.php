
<?php
$categories_id = 7;
$name= "Name";
$mrp=123;
$saleprice=190;
$qty=10;
$image=123;
$short_desc="Hello";
$description="Hello";
$meta_keyword="Hello";
$meta_title="Hello";
$meta_description="Hello"; 

$sql="insert into product (categories_id, name, mrp, saleprice, qty, image, short_desc, description, meta_keyword, 
         meta_title,  meta_description, status) values
         ('$categories_id', '$name', '$mrp', '$saleprice', '$qty', '$image', '$short_desc', '$description', '$meta_keyword', 
         '$meta_title',  '$meta_description', 1)";

echo $sql;
?>