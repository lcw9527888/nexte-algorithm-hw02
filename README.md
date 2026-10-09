# nexte-algorithm-hw02

## 项目简介

本项目是 NEXT-E 算法组第二次培训作业，使用 Git/GitHub 管理 C++ 算法项目，使用 CMake 统一构建三道算法题：

1. `streak`：最长连续命中
2. `unique_ids`：目标编号整理
3. `range_sum`：区间数据求和

## 目录结构

```text
nexte-algorithm-hw02/
├── README.md
├── .gitignore
├── CMakeLists.txt
├── commands.txt
├── run_tests.sh
├── src/
│   ├── streak.cpp
│   ├── unique_ids.cpp
│   └── range_sum.cpp
└── tests/
    ├── streak_sample.in / .out
    ├── streak_edge1.in / .out
    ├── ...
    └── range_sum_edge3.in / .out
    
    
环境版本
系统：ubuntu
编译器：g++
CMake：3.26
Git:2.x



git clone <你的仓库链接>
cd nexte-algorithm-hw02

# 构建
cmake -S . -B build
cmake --build build

# 运行三道题的样例
./build/streak < tests/streak_sample.in
./build/unique_ids < tests/unique_ids_sample.in
./build/range_sum < tests/range_sum_sample.in

# 批量运行所有测试
chmod +x run_tests.sh
./run_tests.sh

1.streak
通过一次循环，遇到1就加命中数，遇到0就清零命中数
时间复杂度：O(n)，只需遍历一遍输入。
·空间复杂度：O(1)，仅使用常数个变量。

2.unique_ids
用动态头文件存储所有编号，再将数组排序，最后删除重复元素
时间复杂度：排序为 O(n \log n)，去重和遍历为 O(n)，总体为 O(n \log n)。
空间复杂度：O(n)，需要存储所有编号。

3.range_sum
定义一个数组，然后用数组中的数据表示之和，读取数据时可完成计算。
利用deepseek提供的IO优化将溢出数据时提高输出速度
 时间复杂度：预处理 O(n)，每次查询 O(1)，总复杂度 O(n + q)。
空间复杂度：O(n)，存储前缀和数组。


题目                     测试文件                      覆盖情况      是否通过
streak     streak_sample    题目样例           是
streak     streak_edge1    仅一次射击         是
streak     streak_edge2    全部未命中         是
streak     streak_edge3     全部命中           是
unique_ids unique_ids_sample 题目样例         是
unique_ids unique_ids_edge1 只有一个编号   是
unique_ids unique_ids_edge2 全部相同            是
unique_ids unique_ids_edge3 逆序且无重复    是
range_sum range_sum_sample  题目样例             是
range_sum range_sum_edge1    l = r      是
range_sum range_sum_edge2   查询整个序列     是
range_sum range_sum_edge3    全负数               是


Git 与 GitHub 的区别
Git：本地版本控制工具，用来记录代码修改历史、管理分支和合并。
GitHub：基于 Git 的远程代码托管平台，用来保存远程仓库、协作开发和提交作业。
Git 不依赖 GitHub 也能使用；GitHub 上的仓库本质上也是 Git 仓库。

add、commit、push 分别的作用
git add：把工作区中的修改加入暂存区，准备提交。
git commit：把暂存区的内容保存为一次本地提交，形成版本历史。
git push：把本地提交推送到远程仓库（GitHub）。


本次分支与合并说明

本次作业先在默认分支 main 完成项目初始化，随后创建 feature/algorithms 分支，在此分支依次完成 streak、unique_ids、range_sum 三道题及测试，分别提交。完成后切回 main，使用 git merge feature/algorithms 合并分支，最后推送到 GitHub。

AI辅助说明

用ChatGPT对三个程序题目进行了优化，用deepseek辅助进行了作业说明，在进行自主手动测试后，用deepseek书写了自动化测试脚本的程序


