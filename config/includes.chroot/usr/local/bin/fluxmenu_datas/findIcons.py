import os,re,shutil,sys
from os.path import expanduser

def find_icons(startdir):
    for basedir, subdirs, files in os.walk(startdir):
        for name in files:
            print "Found", name
    return

#def set_style(style):
#    newStyleName = "session.styleFile:\t"+expanduser("~/.fluxbox/styles/"+style+"\n")
#    oldStyleName = ""
#    shutil.copyfile(expanduser("~/.fluxbox/init"),expanduser("~/.fluxbox/init.bckp"))
#    cFile = open(expanduser("~/.fluxbox/init.bckp"),"r")
#    text = cFile.readlines()
#    cFile.close()
#    input = open(expanduser("~/.fluxbox/init.bckp"),"r")
#    styleLine = re.compile(r"session.styleFile")
#    for x in text:
#        if styleLine.search(x):
#            oldStyleName = x 
#    output = sys.stdout
#    output =  open(expanduser("~/.fluxbox/init"),"w")
#    for s in input.readlines():
#        output.write(s.replace(oldStyleName,newStyleName))
#    output.close()
#    input.close()
#    os.system('killall -s HUP fluxbox')
#    return
