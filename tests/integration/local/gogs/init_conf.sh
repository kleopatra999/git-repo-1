#!/bin/bash
if [[ `uname -o` == Cygwin ]] ; then
  GOGS_ROOT=$(cmd /c cd|dos2unix)'\gogs-repositories'
else
  GOGS_ROOT=$(pwd)'/gogs-repositories'
fi
python3 -c "import sys;from six.moves.configparser import ConfigParser;from six.moves import cStringIO;c=ConfigParser();c.read_string('[APP]\n'+open('custom/conf/app.ini').read());gogsroot=sys.argv[1].replace('\\\\','/');[lambda:0,sys.exit][c.get('repository','ROOT')==gogsroot]();f=cStringIO();c.set('repository','ROOT',gogsroot);print(c.get('repository','ROOT'));c.write(f);open('custom/conf/app.ini','w').write(f.getvalue().replace('[APP]\n',''))" "$GOGS_ROOT"
