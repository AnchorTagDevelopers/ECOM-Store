<?php
session_start();
$user = 'root';
$pass = '';
$db = 'ecom';
$con = new mysqli('localhost', $user, $pass, $db) or die("Unable to connect");

define('SERVER_PATH',$_SERVER['DOCUMENT_ROOT'].'/ecom/');
define('SITE_PATH','http://localhost/ecom/');
define('PRODUCT_IMAGE_SERVER_PATH', SERVER_PATH.'media/product/');
define('PRODUCT_IMAGE_SITE_PATH', SITE_PATH.'media/product/');

?> 