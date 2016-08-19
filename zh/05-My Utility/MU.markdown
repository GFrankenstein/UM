# 个人小工具 #

本章介绍一下自己开发的一些小工具。因为经历时期比较长，而且并没有按照开发顺序编写，所以没有一个清晰统一的程序设计风格。

## 几何结构变换 ##

几何结构变换主要指对 XYZ 坐标的变换操作。目前包括对一个分子几何结构的旋转操作和两个结构之间的线性插值工具。

### 单分子 XYZ 坐标变换 ###

#### 实现方式和原理 ####

工具采用 Python 编写，一个实例程序代码如下：

文件名为 `Geom_XY_rotate.py`：

    import math
    x1=0.0504214577
    y1=1.0819963150
    x2=-1.0520729230
    y2=0.2576932903
    k=(y2-y1)/(x2-x1)
    b=y2-k*x2
    x6=(x1+x2)/2
    y6=(y1+y2)/2
    r=math.sqrt(x6*x6+y6*y6)
    theta=math.asin(r/b)

    atom=[]
    x=[]
    y=[]
    z=[]
    sample=open('Geom.xyz','r')
    while True:
        line=sample.readline()
        if len(line)==0:
            break
        word=line.split()
        atom=atom+[word[0]]
        x=x+[float(word[1])]
        y=y+[float(word[2])]
        z=z+[float(word[3])]
    sample.close()

    N=56
    f=open('GR_Rotated.xyz','w')
    for i in range(N):
        xx=x[i]*math.cos(-theta)+y[i]*math.sin(-theta)
        yy=-x[i]*math.sin(-theta)+y[i]*math.cos(-theta)
        f.write(atom[i]+' '+str(-xx)+' '+str(yy)+' '+str(-z[i])+'\n')
    f.close()

代码第一部分是一个实例中先计算出旋转角度 `theta`。第二部分是读取几何结构。第三部分是对坐标操作并输出。

主要原理就是读取几何结构，然后进行空间操作后输出。实例程序为将分子在 XY 平面内旋转角度 $\theta$ 的工具。

#### 用法示例 ####

仍以上述工具为例，将需要变换的几何结构复制到 `Geom.xyz` 这个文件中，在终端中运行此 Python 脚本，

    python Geom_XY_rotate.py

即可产生文件名为 `GR_Rotated.xyz` 的输出文件。

### 分子间的几何结构线性插值 ###

#### 实现方式和原理 ####

采用 Python 编写，源代码如下：[`Geom_Inter.py`](https://github.com/GFrankenstein/UM/blob/master/pdf/src/GI/Geom_Inter.py)

其中，前三段分别是初始化并读取起始和终了几何结构，最后一段进行线性插值计算。为了照顾对称性，保留了 6 位小数。

本工具附带了几个 Shell 脚本配合使用：

这里是一个生成 molpro 输入文件的样例。`GI_molpro_Gen.sh` 代码如下：

    python Geom_Inter.py
    for name in `ls *.com`
    do
        cat Head $name Tail > tmp
        mv tmp $name
    done

就是将插值好的坐标文件与除几何结构外输入文件的部分和坐标输入拼接起来，即可得到需要的所有输入文件（例子中在始末结构之间插入 15 个点）。最后就是 [`molpro_run.gen`](https://github.com/GFrankenstein/UM/blob/master/pdf/src/GI/molpro_run.gen) 和 [`molpro_run.sh`](https://github.com/GFrankenstein/UM/blob/master/pdf/src/GI/molpro_run.sh) 分别用来生成脚本和批量运行这些输入文件，以及 [`Traj_print.sh`](https://github.com/GFrankenstein/UM/blob/master/pdf/src/GI/Traj_print.sh) 用来将插值的轨迹保存为一个 XYZ 格式轨迹动画，`trajectory.xyz`。

#### 用法示例 ####

- 先把需要生成的计算输入文件将除几何结构的部分替换到 `Head` 和 `Tail` 两个文件中；
- 将初始和终了的几何结构 XYZ 坐标（注意前后要一致对应才有效）替换到 `GeomO` 和 `GeomX` 两个文件内，运行 `./GI_molpro_Gen.sh`；
- 运行 `./molpro_run.gen`；
- 运行 `./molpro_run.sh`；
- 计算完成后，运行 `./Traj_print.sh`。可以使用 Avogadro 看一下轨迹 `trajectory.xyz` 是否正确。

## IRD ##

IRD 的方法来源于 Robb 的[一篇文献](http://www.sciencedirect.com/science/article/pii/000926149500821K)。这个工具开发得很不成熟。

#### 实现方式和原理 ####

将文献中的方法用程序实现了出来。仍使用的 Python 实现，需要用到 [SciPy](http://www.scipy.org) 库。

源代码如下：[`IRD.py`](https://github.com/GFrankenstein/UM/blob/master/pdf/src/IRD/IRD.py)

这个程序注释得较为详尽，基本上就是从输出文件读出需要的数据后，利用文献的方法计算，最值优化方法是库中的 L-BFGS-B 方法。因为程序比较不成熟，所以目前针对性比较强，计算对象是环丁二烯，格式解析 molpro 的 `.out` 文件。

除计算主程序外，和几个 Shell 脚本一起使用。其中，文件名含 `MW` 是使用了质重坐标系，`get_*` 是用来获取 `.out` 中的几何结构、梯度和 Hessian，`format_*` 用来将获得的数据格式化为 `IRD.py` 读取的模式。

其他辅助性脚本有 `MW2XYZ.sh` 用来进行质重坐标向 Cartesian 坐标转换（此处针对环丁二烯），`trajectory.sh` 用来看 IRD 轨迹。（源码请参考 `src` 路径下）

#### 用法示例 ####

- 先用一个 `*.com` 计算频率以得到 Hessian；
- 在 `IRD.py` 里可修改形如 `# <<--` 的箭头指向的的注释的变量，比如初始能量 `E0` 和步长 `rmax` 等；
- 运行 `./IRD.sh` 或者 `./IRD_MW.sh` 即可得到 Cartesian 或质重坐标系下的结果。通过修改 `IRD*.sh` 中的循环次数可以控制 IRD 轨迹点数。

## 能量优化 ##

#### 实现方式和原理 ####

这个是和 IRD 工具类似的思路，利用 Python 和 Shell 脚本调用 GAMESS 完成 MRMP 的能量优化任务。最值优化方法仍然是 SciPy 里的 L-BFGS-B。Shell 进行调用程序或者文本格式处理，Python 进行算法流程的实现。

源代码文件：[`OPT.py`](https://github.com/GFrankenstein/UM/blob/master/pdf/src/E_OPT/OPT.py)

#### 用法示例 ####

- 替换初始几何结构 `GeomO`；
- 替换除几何结构外的输入文件部分 `Head` 和 `Tail`；
- 运行 `./RUN_OPT.sh`。

## ci vector 系数统计 ##

ci vector 的系数统计在将轨道局域化后变得十分有用，因为局域化后局域化的原子轨道的 ci vector 系数变得分散。这里最主要的是统计出离子性、共价性的表现。

#### 实现方式和原理 ####

核心思路就是用 Linux 文本编辑工具进行文本处理，写成 Shell 脚本方便使用。

源码文件：[`couple.sh`](https://github.com/GFrankenstein/UM/blob/master/pdf/src/ci_stat/couple.sh)

即提取需要的数据后再利用正则表达式匹配并进行统计求和。

#### 用法示例 ####

以环丁二烯为例。在仅有局域化轨道结果输出文件的路径下，运行 `./couple.sh` 即可得到对环丁二烯的离子性、共价性的统计分析。（molpro 软件通过 `thresh,thrpri=1e-7` 可以将 ci vector 系数大于 $1\times 10^{-7}$ 的结果全部输出）
