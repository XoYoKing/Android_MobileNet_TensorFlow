# 在Android手机上运行自己训练的MobileNet模型识别手势数字，通过修改官方例程App实现

使用MoblieNet训练了一个识别数字手势的模型，先看看识别效果。



下面是教程：

## 首先要从git上下载官方的例程，https://github.com/tensorflow/tensorflow
## 第一步搜集足够多的样本图片，使用官方例程中的tensorflow/examples/image_retraining训练出自己的模型。

由于找不到合适的手势图片集，我使用手机的连拍功能，找了几个小伙伴，一起拍了大概三千张照片，制作了一个简单的手势图片集。


之后再image_retraining目录下建立一个文件夹，将图片放入，在子文件夹中分类，子文件夹名称就是类别名称。

之后运行retrain.py脚本

[python] view plain copy
python retrain.py     --image_dir hands   --architecture mobilenet_1.0_224 --output_labels hands_labels.txt --output_graph hands_graph.pb   
[python] view plain copy
  
[python] view plain copy
image_dir 是图片文件夹名  
[python] view plain copy
architecture 是所选用的模型  
[python] view plain copy
output_labels 是输出的模型名  
[python] view plain copy
output_graph 是模型对应的label文件  
其中label和graph文件使我们需要的两个文件，成功生成这两个文件后可以进行第二步。

## 第二步是修改tensorflow/examples/android这个程序。

先安装android studio，然后选择open project，打开tensorflow/examples/android，编译运行，中间需要什么库就安装什么库。运行成功后手机上会安装四个demo app，挺有意思，大家可以玩玩。

我们通过修改其中的TF classify，在其中运行我们刚刚训练的自己的模型。

首先将刚刚生成的pb和txt文件放入tensorflow/examples/android/asset文件夹内

修改tensorflow/examples/android/src/org/tensorflow/demo/ClassifierActivity.java中的

[javascript] view plain copy
private static final int INPUT_SIZE = 224;     
private static final int IMAGE_MEAN = 128;  
private static final float IMAGE_STD = 128 ;  
private static final String INPUT_NAME = "input";  
private static final String OUTPUT_NAME = "final_result";  
  
private static final String MODEL_FILE = "file:///android_asset/hands_graph.pb";   （改成自己的pb）  
private static final String LABEL_FILE =  
    "file:///android_asset/hands_labels.txt";（改成自己的txt文件名）  
编译运行，之后就会发现TF classify中已经变成了自己的模型。
