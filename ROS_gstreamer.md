# Using Gstreamer 0.1 with ROS kinetic

Do you want to use your webcam with ROS? 

## Requirements

http://wiki.ros.org/gscam

```
sudo apt-get install gstreamer0.10
```

checkout the [cheat sheet](http://wiki.oz9aec.net/index.php/Gstreamer_cheat_sheet)


### test your webcam

```
$ gst-launch-0.10 v4l2src ! xvimagesink
```

## calibrate your camera with the ROS calibration toolkit

http://wiki.ros.org/camera_calibration


