# Qt creator 

download: https://download.qt.io/official_releases/qtcreator/4.4/4.4.1/

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


