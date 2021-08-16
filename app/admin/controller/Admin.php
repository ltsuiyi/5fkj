<?php
/**
 * Created by Land
 * User: tao <375419582@qq.com>
 * DateTime: 2021/8/4 15:26
 * Description:
 */


namespace app\admin\controller;



use app\common\business\AdminRepository;
use app\common\business\LandRepository;
use app\common\mysql\LandModel;
use app\common\mysql\LandTypeModel;
use app\common\mysql\LatinTypeModel;
use think\App;
use think\Request;


class Admin extends  Base
{
   protected $repository;
    /**
     * Land constructor.
     * @param Request $request
     */
    public function __construct(App $app)
    {

        $this->repository = new AdminRepository();
        parent::__construct($app);
    }

    /**
     * @Describe:获取土地列表数据
     * @param LandRepository $repository
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/06 16:22
     */
    public function getPageList()
    {
        $page = (int)input('page',1);
        $limit = (int)input('limit',15);
        $data = $this->request->param();                    /*获取搜索数据*/
        return $this->repository->getPageList($page,$limit,$data);
    }

    /**
     * @Describe:渲染土地列表页面
     * @return \think\response\View
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/06 16:22
     */
    public function index()
    {
        return view();
    }

    /**
     * @Describe:渲染添加页面
     * @return \think\response\View
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/06 16:23
     */
    public function add()
    {
        return view();
    }

    /**
     * @Describe:渲染编辑页面和修改数据
     * @return \think\response\View
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/06 16:25
     */
    public function edit()
    {
        $id = input('id');
        $info = $this->repository->getFindData($id);
        $landType = LandTypeModel::select()->toArray();     /*获取土地分类数据*/
        $latinType = LatinTypeModel::select()->toArray();   /*获取土地流转类型数据*/
        return view('admin/edit', [
            'info'  =>$info,
            'landType'=>$landType,
            'latinType'=>$latinType
        ]);
    }

    /**
     * @Describe:删除功能
     * @return mixed
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/06 16:26
     */
    public function delById()
    {
        $id  =  input('id');
        return $this->repository->delById($id);
    }

    /**
     * @Describe:添加编辑
     * @param LandRepository $repository
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/06 16:39
     */
    public function doAll()
    {
        $data = $this->request->param();                    /*获取提交数据*/
        return $this->repository->doAllData($data);
    }

    /**
     * @Describe:软删除页面
     * @return \think\response\View
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 19:27
     */
    public function recycle()
    {
        return view();
    }

    /**
     * @Describe:回收站数据
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 19:27
     */
    public function getRecycleData()
    {
        $page = (int)input('page',1);
        $limit = (int)input('limit',15);
        $data = $this->request->param();                    /*获取搜索数据*/

        return $this->repository->getRecycleData($page,$limit,$data);
    }

    /**
     * @Describe:真实删除
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 19:30
     */
    public function delTrue()
    {
        $id  =  input('id');
        return $this->repository->delTrue($id);
    }

    /**
     * @Describe:恢复数据
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 21:52
     */
    public function recycleData()
    {
        $id = $this->request->param('id');                    /*获取搜索数据*/
        return $this->repository->recycleData($id);
    }
}