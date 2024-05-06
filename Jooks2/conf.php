<?php
$kasutaja='root';
$serverinimi='localhost';
$parool='';
$andmebaas='jooksvoistlus';
$yhendus=new mysqli($serverinimi, $kasutaja, $parool, $andmebaas);
$yhendus->set_charset('UTF8');