cd ${LOCALBASE}
git clone https://github.com/zimbatm/direnv.git
cd direnv
DESTDIR=${LOCALBASE} make install
hash -r
