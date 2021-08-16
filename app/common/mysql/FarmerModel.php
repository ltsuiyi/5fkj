<?php
/**
 * Created by LandModel
 * User: tao <375419582@qq.com>
 * DateTime: 2021/8/5 20:58
 * Description:
 */


namespace app\common\mysql;


use app\common\traits\JumpReturn;
use think\model\concern\SoftDelete;

class FarmerModel extends BaseModel
{

    use JumpReturn;
    use SoftDelete;
    protected $autoWriteTimestamp = true;
    protected $deleteTime = 'delete_time';
    protected $defaultSoftDelete = 0;
    protected $table = '5fkj_farmer';

    /**
     * @Describe:农机类型
     * @return \think\model\relation\HasOne
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 23:11
     */
    public function FarmerType()
    {
        return $this->hasOne(FarmerTypeModel::class,'id','type_id');
    }

    /**
     * @Describe:农机服务类型
     * @return \think\model\relation\HasOne
     * @User:tao <375419582@qq.com>
     * @Time:2021/08/08 23:11
     */
    public function FarmerServiceType()
    {
        return $this->hasOne(FarmerServiceTypeModel::class,'id','service_id');
    }
}