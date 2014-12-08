<?php
/**
 * Created by PhpStorm.
 * User: rappresent
 * Date: 11/15/14
 * Time: 9:32 AM
 */

$urlQuery = function ($connect, $param, $table) {
	$page = "1";
	$size = 0;
	$temp = "";
	$whereArr = array();
	$whereLArr = array();
	$groupbyArr = array();
	$orderbyArr = array();
	$data = array();

	$data['_first_'] = $param;
	$data['select'] = "SELECT *";
	$data['from'] = "FROM `".$table."`";
	$data['groupby'] = "";
	$data['where'] = "WHERE `active` = ('1') ";
	$data['whereArr'] = array();
	$data['whereLArr'] = array();
	$data['orderby'] = "";
	$data['orderbyArr'] = array();
	$data['limit'] = "";
	$data['result'] = "";

	ksort($param);

	foreach ($param as $key => $row) {
		$row = mysqli_real_escape_string($connect, $row);
		if ($key == 'fs') {
			if (!empty($row)) {
				$x = '';
				foreach (explode(',',$row) as $r) {
					if ($r === '*') {
						$x .= $r.", ";
					} else {
						$x .= "`".$r."`, ";
					}
				}
				$data['select'] = "SELECT ".substr($x, 0, -2);
			}
		}
		if ($key == 'g') {
			if (!empty($row)) {
				$x = '';
				foreach (explode(',',$row) as $r) { $x .= "`".$r."`, "; }
				$data['groupby'] = "GROUP BY ".substr($x, 0, -2);
			}
		}
		if ($key == 'p') {
			if (intval(!empty($row)) > 0) $page = $row;
		}
		if ($key == 's') {
			if (intval(!empty($row)) > 0) $size = $row;
		}
		//
		$k = preg_replace("/.[vnl]/", "", $key);
		if (preg_match_all("/f[0-9]+/", $k) == 1) {
			$whereArr[] = $k;
		}
		if (preg_match_all("/lgc[0-9]+/", $k) == 1) {
			$whereLArr[] = $k;
		}
		if (preg_match_all("/g[0-9]+/", $k) == 1) {
			$groupbyArr[] = $k;
		}
		if (preg_match_all("/o[0-9]+/", $k) == 1) {
			$orderbyArr[] = $k;
		}
	}

	if ($size > 0) $data['limit'] = "LIMIT ".strval(($page*$size)-$size).", ".$size;
	if (count($whereArr) > 0) {
		foreach (array_unique($whereArr) as $row) {
			$field = ""; $logic = ""; $value = "";

			if(array_key_exists($row."_n", $param)) $field = $param[$row."_n"];
			if(array_key_exists($row."_l", $param)) $logic = $param[$row."_l"];
			if(array_key_exists($row."_v", $param)) $value = $param[$row."_v"];

			if ((!empty($field)) && (!empty($logic)) && (!empty($value))) {
				$x = '';
				foreach (explode(',',$value) as $r) {
					if(strtolower($logic) == 'like') {
						$x .= "'%".$r."%', ";
					} else {
						$x .= "'".$r."', ";
					}
				}
				$value = substr($x, 0, -2);

				$data['whereArr'][] = "`".$field."` ".$logic." (".$value.")";
			}
		}
	}
	if (count($whereLArr) > 0) {
		$data['whereLArr'] = array();
		foreach (array_unique($whereLArr) as $row) {
			if (!empty($param[$row])) {
				$data['whereLArr'][] = " ".$param[$row]." ";
			}
		}
	}
	if (count($orderbyArr) > 0) {
		foreach (array_unique($orderbyArr) as $row) {
			$field = ""; $logic = "";

			if(array_key_exists($row."_n", $param)) $field = $param[$row."_n"];
			if(array_key_exists($row."_v", $param)) $value = $param[$row."_v"];

			if (!empty($field)) {
				$data['orderbyArr'][] = "`".$field."` ".$value;
			}
		}

		if (count($data['orderbyArr']) > 0) {
			$data['orderby'] = "ORDER BY ".implode($data['orderbyArr'], ', ');
		}
	}
	if (count($data['whereArr']) > 0) {
		$a = count($data['whereArr']);
		$b = count($data['whereLArr']);
		$c = array();
		$x = '';
		$y = 0;

		for ($z = 0; $z <= $a-1; $z++) {
			if ($z !== $a-1) {
				$c[] = $data['whereLArr'][$z];
			} else {
				$c[]="";
			}
		}
		foreach ($data['whereArr'] as $row) {
			$x .= $row.$c[$y];
			$y++;
		}

		$temp = $x;
	}
	if ($temp) {
		$data['where'] .= "AND $temp";
	}
	$data['sqldata'] = $data['select']." ".$data['from']." ".$data['where']." ".$data['groupby']." ".$data['orderby']." ".$data['limit'].";";
	$data['sqltotal'] = "SELECT COUNT(*) AS total ".$data['from']." ".$data['where'].";";

	return $data;
};