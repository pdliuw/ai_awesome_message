# ai_awesome_message ｜ AiAwesomeMessage

A new Awesome message widget that is sames to toast&#x2F;snackbar&#x2F;prompt of Flutter package.

# AiAwesomeMessage

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/ai_awesome_message/blob/master/README-EN.md)|[中文文档](https://github.com/pdliuw/ai_awesome_message)|
|:-|:-|

## 我们的宗旨是：帮助开发者更加便利开发、切身体会编程之美！

### ai_awesome_message ｜ AiAwesomeMessage

[![pub package](https://img.shields.io/pub/v/ai_awesome_message.svg)](https://pub.dev/packages/ai_awesome_message)


[AiAwesomeMessage](https://github.com/pdliuw/ai_awesome_message) 在[项目](https://github.com/flutter-app-sample/flutter_app_sample)中的实战应用[flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)



## 效果图

|iOS|Android|
|:-|:-|
|![AiAwesomeMessage_ios](https://github.com/pdliuw/ai_awesome_message/blob/master/example/raw/ai_awesome_message_render_ios.gif)|![AiAwesomeMessage_android](https://github.com/pdliuw/ai_awesome_message/blob/master/example/raw/ai_awesome_message_render_android.gif)|
|:-|:-|

|macOS|web|
|:-|:-|
|![AiAwesomeMessage_macos](https://github.com/pdliuw/ai_awesome_message/blob/master/example/raw/ai_awesome_message_render_macos.gif)|![AiAwesomeMessage_web](https://github.com/pdliuw/ai_awesome_message/blob/master/example/raw/ai_awesome_message_render_web.gif)|
|:-|:-|


## 1.安装

使用当前包作为依赖库

### 1. 依赖此库

在文件 'pubspec.yaml' 中添加

[![pub package](https://img.shields.io/pub/v/ai_awesome_message.svg)](https://pub.dev/packages/ai_awesome_message)

```

dependencies:

  ai_awesome_message: ^version

```

或以这种方式添加

```

  # AiAwesomeMessage package.
  ai_awesome_message:
    git:
      url: https://github.com/pdliuw/ai_awesome_message.git

```

### 2. 安装此库

你可以通过下面的命令行来安装此库

```

$ flutter pub get


```

你也可以通过项目开发工具通过可视化操作来执行上述步骤

### 3. 导入此库

现在，在你的Dart编辑代码中，你可以使用：

```

import 'package:ai_awesome_message/ai_awesome_message.dart';


```


## 2.使用

### 1.作为Widget使用


```

          Container(
            child:
                AwesomeHelper.createAwesome(title: "title", message: "message"),
          ),


```

### 2.作为Route使用


```

          Navigator.push(
            context,
            AwesomeMessageRoute(
              awesomeMessage: AwesomeHelper.createAwesome(
                  title: "title", message: "message"),
              theme: null,
              settings: RouteSettings(name: "/messageRouteName"),
            ),
          );

```

### 3.作为Route使用并带有Theme


```

          Navigator.push(
            context,
            AwesomeMessageRoute(
              awesomeMessage: AwesomeHelper.createAwesome(
                  title: "title", message: "message"),
              theme: Theme.of(context),
              settings: RouteSettings(name: "/messageRouteName"),
            ),
          );

```

## 3.我们推荐，您这样使用将会为您带来巨大的便利


### 1.作为Widget使用


```

          Container(
            child:
                AwesomeHelper.createAwesome(title: "title", message: "message"),
          ),


```

### 2.作为Route使用

与 Airoute | [![pub package](https://img.shields.io/pub/v/airoute.svg)](https://pub.dev/packages/airoute) 搭配使用，事半功倍！

```

          Airoute.push(
            route: AwesomeMessageRoute(
              awesomeMessage: AwesomeHelper.createAwesome(
                  title: "title", message: "message"),
              theme: null,
              settings: RouteSettings(name: "/messageRouteName"),
            ),
          );
          
          or

          Airoute.push(
            route: AwesomeMessageRoute(
              awesomeMessage: AwesomeHelper.createAwesome(
                  title: "title", message: "message"),
              theme: Theme.of(context),
              settings: RouteSettings(name: "/messageRouteName"),
            ),
          );

```

## LICENSE

    BSD 3-Clause License
    
    Copyright (c) 2020, pdliuw
    All rights reserved.


