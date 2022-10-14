<?php

//require "../config.php";
require "AutomaticHelper.php";
$automaticHelper = new AutomaticHelper();
$todaysDay =  date('D'); //Mon?
$dateMerge = date('d.m.Y H:i');

$automaticHelper->loopThroughAllGH();
      


//$automaticHelper->loopThrough();
//print_r($automaticHelper->loadGHIntoArray())


	
?>