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
[list_sort_x,sort_index] = sort(list_x,1);

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
% 2.2 对维度2进行排序
% 怎么能把它变成树形结构呢，做成cell结构体吗？？？