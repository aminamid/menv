cd ${PORTSDIR}/lang/python
make install

mkdir -p ${HOME}${HOME}
ln -sf ${HOME}/${MYBASE} ${HOME}${HOME}/${MYBASE}

cd ${PORTSDIR}/www/node
make install

cd ${PORTSDIR}/www/npm
make install

