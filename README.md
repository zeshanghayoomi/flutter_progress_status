# Flutter Progress Status
A simple widget that can be used to display progress status of a task, use the provided properties to customise the way you like.

<br>

## How to use
```dart

ProgressStatus(
  radius: 150,
  strokeWidth: 20,
  fillValue: 50,
)

```

<img src="https://raw.githubusercontent.com/zeshanghayoomi/flutter_progress_status/master/repo_assets/simulator1.gif" width="300" height="600">

<br>

<img src="https://raw.githubusercontent.com/zeshanghayoomi/flutter_progress_status/master/repo_assets/simulator2.gif" width="300" height="600">

## Properties

* ***radius***<br>Use this to set the size of the circle default minimum = 15.0 and default maximum = deviceWidth will be applied.

* ***fillValue***<br>Use this to set the fill position.

* ***fillColor***<br>Use this to set the fill color where default is blue color.

* ***backgroundColor***<br>Use this to set the track background color where default is grey color.

* ***isStrokeCapRounded***<br>Use this to set if stroke cap is rounded, default is true.

* ***strokeWidth***<br>Use this to set the width of the track default is 5.0.

* ***showCenterText***<br>Use this to show/hide the percentage in the middle of the circle, default is true.

* ***centerTextStyle***<br>Use this to style the center text.

* ***centerTextAlignment***<br>Use this to position the center text inside the circle.

* ***animationDuration***<br>Use this to set the duration of the animation, default is 1 second.

* ***animationCurve***<br>Use this to set the curve for the animation, default is Curves.fastOutSlowIn.