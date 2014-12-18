cd ${LOCALBASE}
git clone https://github.com/github/hub.git
cd hub
./script/build
mv hub ${LOCALBASE}/bin/
hash -r
