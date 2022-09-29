# fc-web-panel 帮助文档

<p align="center" class="flex justify-center">
    <a href="https://www.serverless-devs.com" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-web-panel&type=packageType">
  </a>
  <a href="http://www.devsapp.cn/details.html?name=fc-web-panel" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-web-panel&type=packageVersion">
  </a>
  <a href="http://www.devsapp.cn/details.html?name=fc-web-panel" class="ml-1">
    <img src="http://editor.devsapp.cn/icon?package=fc-web-panel&type=packageDownload">
  </a>
</p>

<description>

fc-web-panel 基于多个开源项目，拥来快速部署一个类似宝塔的拥有云函数原生能力的 web 管理面板。

</description>

<table>

## 前期准备
使用该项目，推荐您拥有以下的产品权限 / 策略：

| 服务/业务 | 函数计算           | 硬盘挂载            | VPC                 | 其它                |
| --------- | ------------------ | ------------------- | ------------------- | ------------------- |
| 权限/策略 | AliyunFCFullAccess | AliyunNASFullAccess | AliyunVPCFullAccess | AliyunECSFullAccess |

</table>

<codepre id="codepre">

# 代码 & 预览

- [ :smiley_cat:  源代码](https://github.com/devsapp/Serverless-Baota)

</codepre>

<deploy>

## 部署 & 体验

<appcenter>

-  :fire:  通过 [Serverless 应用中心](https://fcnext.console.aliyun.com/applications/create?template=fc-web-panel) ，
[![Deploy with Severless Devs](https://img.alicdn.com/imgextra/i1/O1CN01w5RFbX1v45s8TIXPz_!!6000000006118-55-tps-95-28.svg)](https://fcnext.console.aliyun.com/applications/create?template=fc-web-panel)  该应用。 

</appcenter>

- 通过 [Serverless Devs Cli](https://www.serverless-devs.com/serverless-devs/install) 进行部署：
    - [安装 Serverless Devs Cli 开发者工具](https://www.serverless-devs.com/serverless-devs/install) ，并进行[授权信息配置](https://www.serverless-devs.com/fc/config) ；
    - 初始化项目：`s init fc-web-panel -d fc-web-panel`   
    - 进入项目，并进行项目部署：`cd fc-web-panel && s deploy -y`

</deploy>

<appdetail id="flushContent">

# 应用详情

本项目的希望将宝塔面板的大部分能力在云函数上实现，让使用者能一键部署面板、创建网站并签发 HTTPS 证书，体验到使用云函数的种种优势：无需固定的服务器费用，网站之间相互隔离，自动扩容等。项目仍处于 DEMO 阶段，当前已具备完整的网站创建、管理和证书签发能力。

![demo](image/demo.png)

项目核心使用到的开源项目有：

- [mdserver-web](https://github.com/midoks/mdserver-web): 一款简单 Linux 面板服务，使用 BT.CN 的后台管理界面，运行环境为 Python3
- [kodbox](https://github.com/kalcaddle/kodbox): 一个 NAS+OSS UI文件管理系统，详情见 [start-fc-kodbox](https://github.com/devsapp/start-fc-kodbox)
- [acme.sh](https://acme.sh): 自动化签发免费 HTTPS 证书

</appdetail>

<devgroup>

## 开发者社区

您如果有关于错误的反馈或者未来的期待，您可以在 [Serverless Devs repo Issues](https://github.com/serverless-devs/serverless-devs/issues) 中进行反馈和交流。如果您想要加入我们的讨论组或者了解 FC 组件的最新动态，您可以通过以下渠道进行：

<p align="center">

| <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407298906_20211028074819117230.png" width="130px" > | <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407044136_20211028074404326599.png" width="130px" > | <img src="https://serverless-article-picture.oss-cn-hangzhou.aliyuncs.com/1635407252200_20211028074732517533.png" width="130px" > |
| --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| <center>微信公众号：`serverless`</center>                                                                                         | <center>微信小助手：`xiaojiangwh`</center>                                                                                        | <center>钉钉交流群：`33947367`</center>                                                                                           |

</p>

</devgroup>