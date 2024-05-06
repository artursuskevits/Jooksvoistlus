<?php
$kasutaja='matveikulakovski';
$serverinimi='localhost';
$parool='123456';
$andmebaas='matveikulakovski';
$yhendus=new mysqli($serverinimi, $kasutaja, $parool, $andmebaas);
$yhendus->set_charset('UTF8');