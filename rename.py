import os 
mn = os.listdir('/root/Ravencoin/src/qt/locale')
for t in mn:
    new_name = 'carrot'+ t[5:]
    os.rename('/root/Ravencoin/src/qt/locale/'+t, '/root/Ravencoin/src/qt/locale/'+new_name)
