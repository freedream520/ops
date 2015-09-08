#!/usr/bin/python
# coding:utf8
# *************************************************************************
# Author: snailwalker
# Mail: qiyu1001@gmail.com
# Created Time: 2015-09-08
# *************************************************************************

import os
import time
from datetime import datetime, date


def delete_file(image_file_path):
    temp_time = str(time.mktime(datetime.now().timetuple()))
    image_file_list = os.listdir(image_file_path)
    delete_count = 0
    for i in image_file_list:
        if int(i[0:5]) < int(temp_time[0:5]):
            os.remove(image_file_path + i)
            print '文件名：' + i + '删除成功！'
            delete_count = delete_count + 1

    return delete_count


def main():
    image_file_path = os.path.sep + 'Users' + os.path.sep + 'silent' + os.path.sep + 'Documents' + os.path.sep + 'image' + os.path.sep
    print '开始清理迁移遗留图片....'
    print '本次操作共清理图片数量：' + str(delete_file(image_file_path))
    print '图片清理完毕！'

if __name__ == '__main__':
    main()
