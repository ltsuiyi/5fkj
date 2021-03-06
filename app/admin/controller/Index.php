<?php
declare (strict_types = 1);

namespace app\admin\controller;


use app\BaseController;
use think\facade\View;

class Index extends BaseController
{
    public function index()
    {
      return View::fetch();
    }

    public function console()
    {
        return view();
    }

    public function homepage1()
    {
        return view();
    }

    public function list()
    {
        return view();
    }

    public function base()
    {
        return view();
    }
}
