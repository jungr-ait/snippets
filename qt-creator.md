# Qt creator 

There are two options: 
  * ROS plugin: https://ros-industrial.github.io/ros_qtc_plugin
  * or official qtcreator:

download: https://download.qt.io/official_releases/qtcreator/4.4/4.4.1/

```
cd ~/Downloads
wget https://download.qt.io/official_releases/qtcreator/4.4/4.4.1/qt-creator-opensource-linux-x86_64-4.4.1.run
chmod +x qt-creator-opensource-linux-x86_64-4.4.1.run

mkdir ~/installed
echo "intall the qt creator to installed" 
./qt-creator-opensource-linux-x86_64-4.4.1.run

echo "creating a symlink for the app in the local bin folder, which is in the PATH variable." 
cd ~/bin
ln -s ~/installed/qtcreator4.4.1/bin/qtcreator qtcreator44

```

## code beautifier

check: http://doc.qt.io/qtcreator/creator-beautifier.html for `artistic style`.

### artistic style plugin

check: http://astyle.sourceforge.net/

* download: https://sourceforge.net/projects/astyle/files/astyle/astyle%203.0.1/astyle_3.0.1_linux.tar.gz/download
* unpack and navigate into the astyle folder.
* build and install: `$ cd build/gcc &&  

```
cd ~/Downloads
wget https://sourceforge.net/projects/astyle/files/astyle/astyle%203.0.1/astyle_3.0.1_linux.tar.gz
tar -xf astyle_3.0.1_linux.tar.gz 
cd astyle/build/gcc
mkdir -p ~/installed/astyle
make release shared static  -j 4

# make install refix=${HOME}/installed/astyle
sudo make install

echo "to uninstall: sudo make uninstall"
```


### .astyle file

the a style file can be stored per project or in the home directory. 
```
# .astylerc for vslamfw project and QtCreator 4.1
# I prefer: --style=stroustrup
--style=allman
--add-brackets
--indent-cases
--indent-classes
--indent-namespaces
--indent-switches
--indent-preprocessor
--indent=spaces=2
--add-brackets
--max-code-length=140
--convert-tabs
--break-after-logical
```

## Adding a new color scheme:

* Move the <scheme>.xml file to ~/.config/QtProject/qtcreator/styles.
* Go to Qt Creator -> Preferences..., click in the Text Editor tab, and select Dracula in the Color Scheme.

### Dracular theme

check: https://draculatheme.com/qtcreator/
download: https://github.com/dracula/qtcreator/archive/master.zip


## With ROS

following adoptions must be made:


```
1) CMAKE_PREFIX_PATH to /opt/ros/kinetic
2) CMAKE_INSTALL_PREFIX to <ws>/devel
3) Build directory to <ws>/build
```

In short:

  *  Replace the src/CMakeLists.txt symlink with an actual file
  *  Open qtcreator from the console.
  *  File -> “Open File or project…“, then pick ~/catkin_ws/src/CMakeLists.txt and set the build dir to ~/catkin_ws/build/

  *  Select the tab Projects -> Build Settings and add these CMake arguments:

  * -DCMAKE_INSTALL_PREFIX=../install -DCATKIN_DEVEL_PREFIX=../devel

  *  Close & reopen qtcreator (from a console where you sourced ROS setup.bash!) to make sure it generates the project.
    Ready to go!

