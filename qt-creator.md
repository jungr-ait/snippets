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
make install refix=${HOME}/installed/astyle

echo "to uninstall: sudo make uninstall"
```


