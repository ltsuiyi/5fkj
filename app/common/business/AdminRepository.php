<?php
/**
 * Created by LandRepository
 * User: tao <375419582@qq.com>
 * DateTime: 2021/8/5 22:47
 * Description:
 */


namespace app\common\business;


use app\common\mysql\AdminModel;
use app\common\traits\JumpReturn;
use think\App;
use think\Exception;
use think\model\concern\SoftDelete;

class AdminRepository
{


    use JumpReturn;
    use SoftDelete;
    protected $model;
   public function __construct(array $data = [])
   {
       $this->model =new AdminModel();
   }

    /**
     * @Describe:获取查询土地列表数据
     * @param $page
     * @param $limit
     * @param array $param
     * @param string $order
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/06 16:36
     */
    public function getPageList($page,$limit,array $param=[],$order= 'id desc')
    {
        $where = [];
        if (isset($param['user_name']) && $param['user_name'] != '') {
            $where[] = ['user_name', 'like', "%" . $param['user_name'] . "%"];
        }       /*地址*/
        if (isset($param['phone']) && $param['phone'] != '') {
            $where[] = ['phone', 'like', "%" . $param['phone'] . "%"];
        }       /*地址*/
        if (!empty($param['company_id']) && (int)$param['company_id']!=0) {
            $where[] = ['company_id', '=', $param['company_id']];
        }    /*土地类型*/
        if (!empty($param['group_id']) && (int)$param['group_id']!=0) {
            $where[] = ['group_id', '=', $param['group_id']];
        }/*流转类型*/
        if (!empty($param['status']) && (int)$param['status']!=0) {
            $where[] = ['status', '=', $param['status']];
        }  /*审核状态*/
        if (isset($param['time']) && $param['time'] != '') {
            $ck = @explode(" ~ ", $param['time']);
            $b = $ck[0] . " 00:00:00";
            $e = $ck[1] . " 23:59:59";
            $where[] = ['create_time', 'between', [strtotime($b), strtotime($e)]];
        }     /*时间*/
        try {
            $data = $this
                ->model::with([
                    'LandType'  => function($query){$query->field('id,title');},
                    'LatinType' => function($query){$query->field('id,title');}])
                ->limit($limit)
                ->page($page)
                ->where($where)
                ->order($order)
                ->select()
                ->toArray();

            $count = $this->model->where($where)->count();   /*获取数据总数*/
            return self::Success($data,$count);
        }catch (Exception $exception){

            return self::Success([],'0',$exception->getMessage(),'0');  /*抛出异常*/
        }
    }

    /**
     * @Describe:单条土地列表数据
     * @param $id
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 19:28
     */
    public function getFindData($id)
    {
        $data = $this->model->where('id',$id)->find()->toArray();
        return $data;
    }

    /**
     * @Describe:添加编辑操作
     * @param $data
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/06 16:37
     */
    public function doAllData($data){
        if (isset($data['password']) && $data['password'] != '') {
            $data['password'] = md5($data['password']);
        }
        try {
            if (isset($data['id'])){
                $result= $this->model->update($data);
            }else{
                $result=$this->model->create($data);
            }
            if ($result){
                return self::JsonReturn("更新添加成功");
            }else{
                return self::JsonReturn("更新添加失败",0);
            }
        }catch (\Exception $e){
            return self::JsonReturn($e->getMessage(),0);
        }
    }

    /**
     * @Describe:软删除
     * @param $id
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 17:50
     */
    public function delById($id)
    {
        try {
            // TODO: Implement delById() method.
            if (is_array($id)) {
                $ids = $id;
            } else {
                $ids = @explode(",", $id);
            }
            $result = $this->model::destroy($ids);
            if ($result) {
                return self::JsonReturn("删除成功");
            } else {
                return self::JsonReturn("删除失败", 0);
            }
        } catch (\Exception $exception) {
            return self::JsonReturn($exception->getMessage(), 0);
        }
    }

    /**
     * @Describe:真实删除
     * @param $id
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 17:50
     */
    public function delTrue($id){
        try {
            // TODO: Implement delById() method.
            if (is_array($id)) {
                $ids = $id;
            } else {
                $ids = @explode(",", $id);
            }
            $result = $this->model->destroy($ids,true);
            if ($result) {
                return self::JsonReturn("删除成功",'200');
            } else {
                return self::JsonReturn("删除失败", 0);
            }
        } catch (\Exception $exception) {
            return self::JsonReturn($exception->getMessage(), 0);
        }
    }

    /**
     * @Describe:恢复数据
     * @param $id
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 17:51
     */
    public function recycleData($id){
        try {
            // TODO: Implement delById() method.
            if (is_array($id)) {
                $ids = $id;
            } else {
                $ids = @explode(",", $id);
            }
            $where=[];
            $where[]=["id","in",$ids];
            $result =$this->model->restore($where);

            if ($result) {
                return self::JsonReturn("恢复成功",'200');
            } else {
                return self::JsonReturn("恢复失败", 0);
            }
        } catch (\Exception $exception) {
            return self::JsonReturn($exception->getMessage(), 0);
        }
    }

    /**
     * @Describe:回收站数据
     * @param $page
     * @param $limit
     * @param array $param
     * @param string $order
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 19:29
     */
    public function getRecycleData($page,$limit,array $param=[],$order= 'id asc'){
        $where = [];

        if (isset($param['time']) && $param['time'] != '') {
            $ck = @explode(" ~ ", $param['time']);
            $b = $ck[0] . " 00:00:00";
            $e = $ck[1] . " 23:59:59";
            $where[] = ['delete_time', 'between', [strtotime($b), strtotime($e)]];
        }
        try {
            $list = $this
                ->model
                ->onlyTrashed()
               ->with([
                    'LandType'  => function($query){$query->field('id,title');},
                    'LatinType' => function($query){$query->field('id,title');}])
                ->limit($limit)
                ->page($page)
                ->where($where)
                ->order($order)
                ->select()
                ->toArray();

            $count =$this->model::onlyTrashed()->where($where)->count("id");
            return self::Success($list,$count);
        } catch (Exception $exception) {
            return self::Success([],'0',$exception->getMessage(),'0');  /*抛出异常*/
        }
    }

}