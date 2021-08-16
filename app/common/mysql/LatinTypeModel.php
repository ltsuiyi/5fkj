<?php
/**
 * Created by LatinTypeModel
 * User: tao <375419582@qq.com>
 * DateTime: 2021/8/5 18:49
 * Description:
 */


namespace app\common\mysql;


use app\common\traits\JumpReturn;

class LatinTypeModel extends BaseModel
{
    use JumpReturn;
    protected $autoWriteTimestamp = true;
    protected $table = '5fkj_land_lationtype';

    /**
     * @param $data
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/05 17:52
     * @Describe:添加编辑操作
     */
    public function doAllData($data){
        try {
            if (isset($data['id'])){
                $result= self::update($data);
            }else{
                $result= self::create($data);
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
     * @return \think\Response
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/05 17:38
     * @Describe:获取土地分类数据
     */
    public function getList()
    {
        $data = $this->select()->toArray();
        return self::Success($data);
    }

    /**
     * @param $ids
     * @return \think\Response
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/05 17:36
     * @Describe:批量删除和单条删除
     */
    public function del($ids){
        try {
            if (is_array($ids)){
                $id=$ids;
            }else{
                $id=@explode(",",$ids);
            }
            $result = self::where('id', 'in',$id)->delete();
            if ($result) {
                return self::JsonReturn("删除成功",'204');
            } else {
                return self::JsonReturn("删除失败",0);
            }
        } catch (\Exception $exception) {
            return self::JsonReturn($exception->getMessage(),0);
        }
    }
}