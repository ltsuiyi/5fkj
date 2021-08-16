<?php
/**
 * Created by LandTypeModel
 * User: tao <375419582@qq.com>
 * DateTime: 2021/8/4 15:32
 * Description:土地流转类型
 */


namespace app\admin\controller;



use app\common\mysql\FarmerTypeModel;
use think\App;

class FarmerType extends Base
{
    protected $model;
    public function __construct(App $app)
    {
       $this->model = new FarmerTypeModel();
        parent::__construct($app);
    }

    /**
     * @return mixed|\think\Response
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/04 16:12
     * @Describe:获取土地类型数据
     */
    public function getList()
    {
        return $this->model->getList();
    }
    /**
     * @return \think\response\View
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/04 15:39
     * @Describe:土地类型列表
     */
    public function index()
    {
       return view();
    }

    /**
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/04 15:37
     * @Describe:添加土地类型
     */
    public function add()
    {
        if ($this->post){
            $data = input('post.');
            return  $this->model->doAllData($data);
        }
        return view();
    }

    /**
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/04 15:37
     * @Describe:编辑土地类型
     */
    public function edit()
    {
        $id = input('id');
        $info = $this->model->where('id',$id)->find();

        return view('land_type/edit', [
            'info'  =>$info,
        ]);
    }

    /**
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/04 15:38
     * @Describe:删除土地类型
     */
    public function delete()
    {
        $id  =  input('id');
        return $this->model->del($id);

    }
}