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

This will result in a file like the following `gx660r_ost.yaml` (this calibration is only valid for a fixed focal length->  so auto-focus must not be used):
```
image_width: 1280
image_height: 720
camera_name: gx660r_webcam
camera_matrix:
  rows: 3
  cols: 3
  data: [1469.876855, 0.000000, 729.356170, 0.000000, 1461.272978, 404.328779, 0.000000, 0.000000, 1.000000]
distortion_model: plumb_bob
distortion_coefficients:
  rows: 1
  cols: 5
  data: [0.022089, -0.021554, 0.013627, 0.011987, 0.000000]
rectification_matrix:
  rows: 3
  cols: 3
  data: [1.000000, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000, 0.000000, 0.000000, 1.000000]
projection_matrix:
  rows: 3
  cols: 4
  data: [1477.170654, 0.000000, 739.368058, 0.000000, 0.000000, 1475.130981, 410.406279, 0.000000, 0.000000, 0.000000, 1.000000, 0.000000]
```

this yaml can be store in `roscd gscam && pwd`

a uncalib ini-file (`gx660r_uncalib.ini`) for this webcam looks like:
```
# Camera intrinsics

[image]

width
1024

height
720

[default]

```

## create a gscam launch file:

This launch can be created in `roscd gscam && pwd`. So it simplifies the usage of `gscam` as the launch file will be automaticly propused in the terminal.

Here is the launch file `v4l_gx660r_calib.launch`:
```
<launch>
  <!-- This launchfile should bring up a node that broadcasts a ros image
       transport on /webcam/image_raw -->

  <arg name="DEVICE" default="/dev/video0"/>

  <!-- The GStreamer framerate needs to be an integral fraction -->
  <arg name="FPS" default="30/1"/>
  <arg name="PUBLISH_FRAME" default="false"/>
  <arg name="CAM_NAME" value="gx660r" />
  <arg name="WIDTH" default="1280"/>
  <arg name="HEIGHT" default="720"/>
  <arg name="BRIGHTNESS" default="0"/>

  <!-- Construct the v4l2src format config -->
  <arg name="FORMAT" default="video/x-raw-rgb,width=$(arg WIDTH),height=$(arg HEIGHT),framerate=$(arg FPS)"/>


  <node name="$(arg CAM_NAME)_driver_v4l" pkg="gscam" type="gscam" output="screen">
    <param name="gscam_config" value="v4l2src device=$(arg DEVICE) brightness=$(arg BRIGHTNESS) ! $(arg FORMAT) ! ffmpegcolorspace"/>
    <param name="camera_name" value="$(arg CAM_NAME)" />
    <param name="camera_info_url" value="package://gscam/gx660r_ost.yaml"/>
    <remap from="camera/image_raw" to="$(arg CAM_NAME)/image_raw" />
    <param name="frame_id" value="/$(arg CAM_NAME)"/>
    <param name="sync_sink" value="true"/>
  </node>

  <!-- Provide rectification -->
  <node pkg="image_proc" type="image_proc" name="creative_image_proc"
        ns="$(arg CAM_NAME)" />

  <!-- View the raw and rectified output 
    <node pkg="image_view" type="image_view" name="creative_view" >
      <remap from="image" to="/$(arg CAM_NAME)/image_raw" />
    </node>
      
    <node pkg="image_view" type="image_view" name="creative_view_rect" >
      <remap from="image" to="/$(arg CAM_NAME)/image_rect_color" />
    </node>
  -->

</launch>
```

This file launches a the `gscam` and a `image_proc` node to rectify the camera image.
The following topics are published then:
```
/gx660r/camera_info
/gx660r/image_color
...
/gx660r/image_mono
...
/gx660r/image_raw
...
/gx660r/image_rect
...
/gx660r/image_rect_color
...
```




