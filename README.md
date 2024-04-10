

<h1 align="center">MeasureSizeBuilder</h1>
<p align="center"><img src="https://velog.velcdn.com/images/ximya_hf/post/06f75bb3-5222-4029-a5a8-93d794a1507c/image.png"/></p>
<p align="center">The MeasureSizeBuilder is used when you want to dynamically measure the rendering size of a widget that has variable size depending on the data or child widgets being displayed. </p><br>

<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
  <a href="">
    <img src="https://img.shields.io/pub/v/measure_size_builder"
      alt="Pub Package"/>
  </a>
  <a href="https://opensource.org/licenses/MIT">
    <img src="https://img.shields.io/github/license/aagarwal1012/animated-text-kit?color=red"
      alt="License: MIT" />
  </a>


</p><br>    



<p align="center"><img  src="https://velog.velcdn.com/images/ximya_hf/post/0a8740ba-02c2-4258-a915-cd570a8913e0/image.png"/></p>
<p align="center"><a href="https://measure-size-builder-example.netlify.app/">MeasureSizeBuilder Example</a></p>
<p align="center">You can test the MeasureSizeBuilder feature on the example site provided above!</p>


# Key Features

* 🔑 Easy to use
* 🗂️ Allows accessing the rendering size values of widgets to handle UI appropriately
* ⏰ Detects and returns changed size when the size of the widget changes dynamically

<br/>


# Installing

To use the Single Import Generator package in your Flutter project, follow these steps:

1. Depend on it

Add the following line to your project's `pubspec.yaml` file under the `dependencies` section:

```yaml
dependencies:
  measure_size_builder: ^1.0.0
```

2. Install it

Run the following command in your terminal or command prompt:

```
$ flutter pub get
```


3. Import it
   Add the following import statement to your Dart code:
```dart
import 'package:measure_size_builder/measure_size_builder.dart';
```

<br/>


# Usage

### Return the widget you want to measure inside MeasureSizeBuilder


```dart
MeasureSizeBuilder(  
  builder: (context, size) {  
    log('height : ${size.hieght} width: ${size.width}');  
    return Container(  
        child : SomeWidget(),  
    );  
  },  
)
```

The usage is straightforward. Wrap the widget you want to measure with MeasureSizeBuilder. The rendered size of the widget is returned as an object of type `Size`. Please note that the initial value of Size is `Size(0,0)`. It returns the precise rendering size of the widget being measured after the widget has finished rendering.

<br/>


### Handle UI conditionally based on widget size

```dart
MeasureSizeBuilder(  
  builder: (context, size) {  
    return Container(  
      color: size.height > 300 ? Colors.red : Colors.blue,  
      child: SomeWidget(),  
    );  
  },  
)
```

Widgets returned inside MeasureSizeBuilder can access the `size` value to handle UI conditionally.

<br/>

### Measure the size of widgets that change dynamically

```dart
MeasureSizeBuilder(  
  sensitivity: Duration.zero, 
  builder: (context, size) {  
    log('Widget Size that changes dynamically : $size');  
    return const ExpansionTile(  
      title: Text('ExpansionTile'),  
      subtitle: Text('Trailing expansion arrow icon'),  
      children: <Widget>[  
        ListTile(title: Text('This is tile number 1')),  
      ],  
    );  
  },  
)
```

Even when the size of widgets like ExpansionTile changes dynamically, MeasureSizeBuilder detects this and returns the changed size. You can control how quickly the widget size changes are detected using the `sensitivity` property. The shorter the Duration value for sensitivity, the more frequently the widget size changes are returned. However, note that with frequent size changes, the widget inside MeasureSizeBuilder will be re-rendered each time. <b>If you only need the final size of the widget without real-time access to the size values, provide a generous duration<br/>.













