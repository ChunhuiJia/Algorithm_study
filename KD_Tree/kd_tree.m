clc,clear;
% step1:随机生成二维节点
row_num =10;
list_x = zeros(row_num,1);
list_y = zeros(row_num,1);
for i = 1:row_num
    list_x(i)=rand(1)*100;
    list_y(i)=rand(1)*100;
end
% step2:构建kd树
% 2.1 对维度1进行排序
[root_x,root_y,temp_list_left_x,temp_list_left_y,temp_list_right_x,temp_list_right_y] = splitTree(list_x,list_y,1); 
% 2.2 对维度2进行排序
% 怎么能把它变成树形结构呢，做成cell结构体吗？？？



% function splitTree()
% brief:分割
% list_x:第一个输入列
% list_y:第二个输入列（第一个输入列和第二个输入列是空间点(x,y)中的x和y）
% var:split_column,分割的维度，1代表对一个输入列进行排序，2代表对第二个输入列进行排序...
function [root_x,root_y,temp_list_left_x,temp_list_left_y,temp_list_right_x,temp_list_right_y] = splitTree(list_x,list_y,split_column)
if split_column == 1
    [~,sort_index] = sort(list_x,1);
elseif split_column == 2
    [~,sort_index] = sort(list_y,1);
else
    h=errordlg("the split_colume of function splitTree occur error");
end
len_sort = length(sort_index);
half_len_sort = round(len_sort/2);
% if len_sort<2
%     disp("the number need to exceed 3");
% else
if mod(len_sort,2) == 1
    middle_index_left = half_len_sort;
else
    middle_index_left = half_len_sort + 1;
end
% end
root_x = list_x(sort_index(middle_index_left));
root_y = list_y(sort_index(middle_index_left));
temp_list_left_x = zeros(middle_index_left-1,1);
temp_list_left_y = zeros(middle_index_left-1,1);
for i=1:middle_index_left-1
    temp_list_left_x(i) = list_x(sort_index(i));
    temp_list_left_y(i) = list_y(sort_index(i));
end
temp_list_right_x = zeros(len_sort - middle_index_left,1);
temp_list_right_y = zeros(len_sort - middle_index_left,1);
for i=1:len_sort-middle_index_left
    temp_list_right_x(i) = list_x(sort_index(i+middle_index_left));
    temp_list_right_y(i) = list_y(sort_index(i+middle_index_left));
end
end