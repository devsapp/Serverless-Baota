# coding=utf-8
import os


def handler(event, context):
    if not os.path.exists("/mnt/auto/kodbox-1.34.04"):
        os.system(
            "wget http://images.devsapp.cn/application/kodbox/kodbox-1.34.04.zip -O /mnt/auto/kodbox-1.34.04.zip")
        os.system("cd /mnt/auto && unzip kodbox-1.34.04.zip")
    return "nas init"
