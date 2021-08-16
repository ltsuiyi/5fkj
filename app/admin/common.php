<?php
// 这是系统自动生成的公共文件

/**
 * @Describe:数组打散字符串
 * @param $str
 * @return string
 * @User:tao <375419582@qq.com>
 * @Time:2021/08/06 22:21
 */
function implodeArr($str){
    if (empty($str)) return '';
    return implode(',',$str);
}

/**
 * @Describe:字符串打散数组
 * @param $str
 * @return false|string[]
 * @User:tao <375419582@qq.com>
 * @Time:2021/08/06 22:23
 */
function explodeArr($str){
    if (empty($str)) return '';
    return explode(',',$str);
}