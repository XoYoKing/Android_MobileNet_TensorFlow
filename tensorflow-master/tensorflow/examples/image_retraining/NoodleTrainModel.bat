echo 运行retrain.py脚本
echo image_dir 是图片文件夹名  
echo architecture 是所选用的模型  
echo output_labels 是输出的模型名  
echo output_graph 是模型对应的label文件     
python retrain.py --image_dir noodles --architecture mobilenet_1.0_224 --output_labels noodles_labels.txt --output_graph noodles_graph.pb
pause