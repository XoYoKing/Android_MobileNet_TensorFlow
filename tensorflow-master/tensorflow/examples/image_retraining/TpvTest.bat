set dirwork=E:\TpvTrain
set test=E:\GitHub\Android_MobileNet_TensorFlow\tensorflow-master\tensorflow\examples\label_image\label_image.py
cd %dirwork%
E:
set dirgraph=output/tpv_graph.pb
set dirlabels=output/tpv_labels.txt
set dirimg=input\noodles\1.jpg
python %test% --graph=%dirgraph% --labels=%dirlabels% --image=%dirimg% --input_layer=input --output_layer=final_result --input_mean=128 --input_std=128 --input_width=224 --input_height=224
pause