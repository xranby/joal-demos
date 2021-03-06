#! /bin/sh

if [ -e ../../setenv-build-jogl-x86_64.sh ] ; then
    . ../../setenv-build-jogl-x86_64.sh
fi

if [ -z "$ANT_PATH" ] ; then
    if [ -e /usr/share/ant/bin/ant -a -e /usr/share/ant/lib/ant.jar ] ; then
        ANT_PATH=/usr/share/ant
        export ANT_PATH
        echo autosetting ANT_PATH to $ANT_PATH
    fi
fi
if [ -z "$ANT_PATH" ] ; then
    echo ANT_PATH does not exist, set it
    exit
fi

#    -Drootrel.build=build-x86_64 \

# BUILD_ARCHIVE=true \
ant  \
    -Dtarget.sourcelevel=1.6 \
    -Dtarget.targetlevel=1.6 \
    -Dtarget.rt.jar=/opt-share/jre1.6.0_30/lib/rt.jar \
    -Drootrel.build=build-x86_64 \
    $* 2>&1 | tee make.joal-demos.all.linux-x86_64.log
