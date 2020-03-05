# ai_awesome_message ｜ AiAwesomeMessage

A new Awesome message widget that is sames to toast&#x2F;snackbar&#x2F;prompt of Flutter package.

# AiAwesomeMessage

![totem](https://raw.githubusercontent.com/pdliuw/pdliuw.github.io/master/images/totem_four_logo.jpg)

-----

|[English Document](https://github.com/pdliuw/ai_awesome_message/blob/master/README-EN.md)|[中文文档](https://github.com/pdliuw/ai_awesome_message)|
|:-|:-|

## Our aim is to help developers make development more convenient and experience the beauty of programming!


### ai_awesome_message ｜ AiAwesomeMessage

[![pub package](https://img.shields.io/pub/v/ai_awesome_message.svg)](https://pub.dev/packages/ai_awesome_message)


[AiAwesomeMessage](https://github.com/pdliuw/ai_awesome_message) in[project sample](https://github.com/flutter-app-sample/flutter_app_sample) Application in actual combat [flutter sample](https://github.com/flutter-app-sample/flutter_app_sample)



## Effect

|iOS|Android|
|:-|:-|
|![AiAwesomeMessage_ios](https://github.com/pdliuw/ai_awesome_message/blob/master/example/raw/ai_awesome_message_render_ios.gif)|![AiAwesomeMessage_android](https://github.com/pdliuw/ai_awesome_message/blob/master/example/raw/ai_awesome_message_render_android.gif)|
|:-|:-|

|macOS|web|
|:-|:-|
|![AiAwesomeMessage_macos](https://github.com/pdliuw/ai_awesome_message/blob/master/example/raw/ai_awesome_message_render_macos.gif)|![AiAwesomeMessage_web](https://github.com/pdliuw/ai_awesome_message/blob/master/example/raw/ai_awesome_message_render_web.gif)|
|:-|:-|


## 1.Install

Use this package as a library

### 1. Depend on it

Add this to your package's pubspec.yaml file:

[![pub package](https://img.shields.io/pub/v/ai_awesome_message.svg)](https://pub.dev/packages/ai_awesome_message)

```

dependencies:

  ai_awesome_message: ^version

```

Or add it this way


```

  # AiAwesomeMessage package.
  ai_awesome_message:
    git:
      url: https://github.com/pdliuw/ai_awesome_message.git

```

### 2. Install it

You can install packages from the command line:

with Flutter:



```

$ flutter pub get


```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

### 3. Import it

Now in your Dart code, you can use:

```

import 'package:ai_awesome_message/ai_awesome_message.dart';


```


## 2.Usage

### 1.Use as Widget



```

          Container(
            child:
                AwesomeHelper.createAwesome(title: "title", message: "message"),
          ),


```

### 2.Use as Route


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

### 3.Use as Route with Theme


```

          Airoute.push(
            route: AwesomeMessageRoute(
              awesomeMessage: AwesomeHelper.createAwesome(
                  title: "title", message: "message"),
              theme: Theme.of(context),
              settings: RouteSettings(name: "/messageRouteName"),
            ),
          );

```

## 3.We recommend that you use it this way will bring you great convenience


### 1.Use as Widget


```

          Container(
            child:
                AwesomeHelper.createAwesome(title: "title", message: "message"),
          ),


```

### 2.Use as Route

With Airoute | [![pub package](https://img.shields.io/pub/v/airoute.svg)](https://pub.dev/packages/airoute) Use with less effort！

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


