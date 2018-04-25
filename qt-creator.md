# Qt creator 

The experience has shown that it is hard to find a good and free IDE for CMake/C++ and/or ROS projects. Fortunately Qt Creator is a real option and makes live easier. It is fast and works like a charm with CMake based projects. 
Syntax highlighting, code completion, refactoring, code navigation, snippets, FakeVIM, Beautifier, debugging, deploying, remote debugging, cross-compilation, Qt based applications, version control, color shemes, etc. are just a fiew highlights. 

## Installation

There are two options: 
  * ROS plugin: https://ros-industrial.github.io/ros_qtc_plugin  (recommended)
  * or official qtcreator installation (following text):

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

## Official Qtcreator with ROS

following adoptions must be made in the CMake project settings:


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
    

# Code Beautifier

more information: http://doc.qt.io/qtcreator/creator-beautifier.html for `artistic style`.

## Arstistic style plugin

### install artistic style plugin

more information: http://astyle.sourceforge.net/

```
cd ~/Downloads
wget https://sourceforge.net/projects/astyle/files/astyle/astyle%203.0.1/astyle_3.0.1_linux.tar.gz
tar -xf astyle_3.0.1_linux.tar.gz 
cd astyle/build/gcc
# local installation: mkdir -p ~/installed/astyle
make release shared static  -j 4

#  local installation: make install prefix=${HOME}/installed/astyle
sudo make install

echo "to uninstall: sudo make uninstall"
```

### artistic - configure Qtcreator

1. start qtcreator
1. Help->About Plugings-> enable C++->Beatuifier(expermental)
1. restart qtcreator
1. Tools->Options... (you should now see a red shoe/a Beautifier entry) -> Beautifier
   1. General->Enable auto format on file save
   1. Artisitic style->Artistic Style Command: `/usr/bin/asytle` (for system installation) or specify `~/installed/astyle`
   1. Artisitic style-> Use file .astylerc in /home/<username>

### create a .astylerc file in your home directory

the a style file can be stored per project or in the home directory . 
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

# Adding a new color scheme:

* Move the <scheme>.xml file to ~/.config/QtProject/qtcreator/styles.
* Tools->Options...->Environment->Interface->Theme:Flat Dark
* Tools->Options...->Environment->Text Editor->Font & Colors->Color Scheme and select Dracula.

## Dracular theme

check: https://draculatheme.com/qtcreator/
download: https://github.com/dracula/qtcreator/archive/master.zip


# Licence template

[ref](http://doc.qt.io/qtcreator/creator-tips.html#adding-a-license-header-template-for-c-code)
Go to Tools > Options > C++ > License Template and paste:
```
/******************************************************************************
* FILENAME:     %FILENAME%
* PURPOSE:      %CLASS% 
* AUTHOR:       %USER%
* MAIL:         <your mail address>
* VERSION:      v0.0.0
* CREATION:     %DATE%
*
*  Copyright (C) %YEAR% 
*  All rights reserved. See the LICENSE file for details.
******************************************************************************/
```

# Text editor settings:

1. Tools->Options...->Text Editor
   1. Behavior->Tab size: 2  and Indent size: 2
   1. Behavior->Tab policy: Spaces only
   1. Behavior->Cleanups Upon Savings: `Clean whitespaces`, `Clean indentations`, `Ensure newline at the end of file`
   1. Display->Display right margin at column: 140
   1. Display->Display line numbers
   1. Display->Visualize whitespaces
   1. etc
   
# Open a ROS catkin workspace with `qtcreator-ros`

After the successfull installation of the `qtcreator-ros` you should be able to open a new terminal with `Ctrl+T` and to run `$ qtcreator-ros`. This should work!
Now you need a existing catkin workspace and navigate into it's root (where the `src` folder and maybe the `build` and `devel` folder is) and type `$ qtcreator-ros .`. In case the `*.workspace` file was already created by qtcreator-ros the project will be loaded, otherwise an error `Faild to Open Project` occurs and the project needs to be configured.


Configuring the project:
1. File->New File or Project
1. Projects->Other Project->ROS Workspace-> Choose...
1. Project Name and Location->Name: `what ever you want`
1. Project Name and Location->Distribution: `should be automatically the installed one`
1. Project Name and Location->Workspace path: Browse to the root of the catkin workspace 
1. Project Name and Location->Next
1. Project Managment->Add to version control: `None`
1. Project Managment->Finish
