git pull origin carrot
#rm -rf /root/.raven
./autogen.sh
./configure --disable-tests --disable-bench --enable-cxx --disable-shared --with-pic CXXFLAGS="-fPIC" CPPFLAGS="-fPIC"
make
#/root/Ravencoin/src/ravend -daemon
#tail -f /root/.raven/debug.log
