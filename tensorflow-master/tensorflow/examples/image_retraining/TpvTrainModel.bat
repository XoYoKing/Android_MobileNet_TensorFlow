echo 运行retrain.py脚本
echo image_dir 是图片文件夹名  
echo architecture 是所选用的模型  
echo output_labels 是输出的模型名  
echo output_graph 是模型对应的label文件 
set dirwork=E:\GitHub\Android_MobileNet_TensorFlow\tensorflow-master\tensorflow\examples\image_retraining
set HH=%time:~0,2%
if /i %HH% LSS 10 (set HH=0%time:~1,1%)
set DateTime=%date:~0,4%%date:~5,2%%date:~8,2%_%HH%%time:~3,2%%time:~6,2%
cd %dirwork%
E:
set diroutput=tpv/output/%DateTime%_tpv_
echo --final_tensor_name=output 
python retrain.py --image_dir tpv/input/ --how_many_training_steps=100000 --architecture mobilenet_1.0_224 --output_labels %diroutput%labels.txt --output_graph %diroutput%graph.pb
pause