<?php
/**
 * Created by Upload
 * User: tao <375419582@qq.com>
 * DateTime: 2021/8/6 21:13
 * Description:
 */


namespace app\admin\controller;


use think\facade\Filesystem;

class Upload extends Base{

    public function upload(){
        $file = request()->file('file');
        try{
            $url=$_SERVER["DOCUMENT_ROOT"];
            // 验证
            validate(['imgFile'=>[
                'fileExt' => 'jpg,jpeg,png,bmp,gif',
                'fileMime' => 'image/jpeg,image/png,image/gif', //这个一定要加上，很重要我认为！
            ]])->check(['imgFile' => $file]);
            // 上传图片到本地服务器
            $saveName = \think\facade\Filesystem::disk('public')->putFile('expert',$file);
            $path =$url.'/'.'storage/'.$saveName;
            $arr = ['status' => 200, 'msg' => '上传成功','title'=>'图片' ,'src' => '/storage/'. $saveName];
            return json($arr);

        } catch (\Exception $e) {
            $arr = ['status' => 0, 'msg' =>'上传失败','eor'=>$e->getMessage()];
            return json($arr);
        }
    }

    public function video()
    {
        @ini_set('memory_limit', '512M');
        $file = request()->file('file');
        try{
            $saveName = \think\facade\Filesystem::disk('public')->putFile('video',$file);
            $arr = ['status' => 200, 'msg' => '上传成功', 'path' => '/storage/'. $saveName];
            return json($arr);
        } catch (\Exception $e) {
            $arr = ['status' => 201, 'msg' => $e->getMessage(), 'path' => '/storage/'. $saveName];
            return json($arr);
        }
    }


    public function one_view()
    {
        $file = request() -> file('file');
        $saveName = Filesystem::disk('public') -> putFile('video', $file, time());
        $savename=str_replace('\\', '/',$saveName);
        if($savename)
        {
            return  json(array('code'=>0,'data'=>array('src'=>'/video/'.$savename)));
        }else{
            return  json(array('code'=>0,'msg'=>'上传失败'));
        }
    }

    public function delete()
    {
        $imgurl = $this->request->param('src');

        if (empty($imgurl)) {
            # code...
            return false;
        } else{
            $url=$_SERVER["DOCUMENT_ROOT"].$imgurl;

            if(file_exists($url)==true){
                unlink($url);
            }
        }


    }

}