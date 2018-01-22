# ROS - rosbag


## playing only selected topics

Example: first check the available topics with:
```
rosbag info 019.bag
```

then filter those with the `--topics` argument
```
rosbag play -l 019.bag --topics /fcu/imu /fcu/mag /evb1000/tagDistance
```
