# Apps Bucket for Scoop

[![Tests](https://github.com/morning-start/apps-bucket/actions/workflows/ci.yml/badge.svg)](https://github.com/morning-start/apps-bucket/actions/workflows/ci.yml) [![Excavator](https://github.com/morning-start/apps-bucket/actions/workflows/excavator.yml/badge.svg)](https://github.com/morning-start/apps-bucket/actions/workflows/excavator.yml)

这是一个专为日常使用设计的[Scoop](https://scoop.sh/)仓库，预配置了各种应用程序。所有设置都开箱即用，无需手动配置。

## ✅ 支持的应用程序

| 应用程序 | 描述 |
| ------- | ----------- |
| **anich** | 一个支持超分辨率的在线动漫弹幕APP。多平台，多番剧源，多弹幕，高清无广告。追番看番必备软件。 |
| **bluegauge** | 一款轻便的托盘工具，可轻松查看蓝牙设备的电池电量。 |
| **browser** | User Data directory for Edge and Chrome |
| **cherry-studio** | A desktop client that supports for multiple LLM providers. |
| **ecopaste** | 🎉跨平台的剪贴板管理工具 | Cross-platform clipboard management tool |
| **firefox-developer-zh-cn** | Developer builds of Firefox: the popular open source web browser. |
| **flclash** | A multi-platform proxy client based on ClashMeta, simple and easy to use, open-source and ad-free. |
| **flowus** | A new generation of knowledge management and collaboration platform. |
| **genp** | Adobe GenP 汉化 |
| **kazumi** | 使用 Flutter 开发的基于自定义规则的番剧采集与在线观看程序。使用最多五行基于 Xpath 语法的选择器构建自己的规则。支持规则导入与规则分享。支持基于 Anime4K 的实时超分辨率。绝赞开发中 (～￣▽￣)～ |
| **keyviz** | A free and open-source tool to visualize your keystrokes in real-time. |
| **olib** | 一个简洁、美观的本地书库 |
| **ollama** | Get up and running with large language models locally. |
| **onecommander** | A modern dual-pane file manager with tabs, columns view, built-in preview, editable themes, and more. |
| **picsharp** | A feature-rich, efficient and flexible cross-platform desktop image compression application. |
| **piliplus** | 使用Flutter开发的BiliBili第三方客户端 |
| **snow-shot** | Snow Shot 是一款功能完备，纯粹社区驱动的工具软件 |
| **spacedesk-driver** | Multi Monitor App |
| **utools** | 新一代效率工具平台 |
| **venera** | A comic reader that support reading local and network comics. |
| **wxread-auto** | The vscode extension downloader: install last version of vscode extensions. |

## 🛠 配置亮点

所有应用程序均已配置为：

* 自动将二进制文件添加到`PATH`
* 将持久化数据存储在`scoop/persist`目录中
* 在安装后应用常见配置（如注册表设置、配置文件等）

## 🧪 使用说明

将此仓库添加到Scoop：

```powershell
scoop bucket add apps https://github.com/morning-start/apps-bucket.git
scoop bucket add apps https://gitee.com/morning-start/apps-bucket.git
```

## 📄 许可证

MIT / Apache-2.0 / BSD 等。详情请参见各个工具的许可证。
