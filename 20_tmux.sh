cd ${LOCALBASE}/src
curl -L https://github.com/downloads/libevent/libevent/libevent-2.0.21-stable.tar.gz | tar xfz -
cd libevent-2.0.21-stable
./configure --prefix=${PREFIX}
make
make install
cd ${LOCALBASE}/src
curl -L http://cznic.dl.sourceforge.net/project/tmux/tmux/tmux-1.9/tmux-1.9a.tar.gz | tar xfz - 
cd tmux-1.9a
LDFLAGS=-L${LD_RUN_PATH} CPPFLAGS=-I${LOCALBASE}/include ./configure --prefix=${LOCALBASE}/tmux 
make
make install
cd ${LOCALBASE}/bin
ln -s ../tmux/bin/tmux tmux

