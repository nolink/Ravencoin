import os 
mn = os.listdir('/root/Carrotcoin/src/qt/locale')
for t in mn:
    new_name = 'carrot'+ t[5:]
    os.rename('/root/Carrotcoin/src/qt/locale/'+t, '/root/Carrotcoin/src/qt/locale/'+new_name)
