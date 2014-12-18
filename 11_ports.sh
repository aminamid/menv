mkdir -p ${LOCALBASE}/{etc,lib,tmp/dist,tmp/work,var/db/pkg}
cd ${HOME}/${MYBASE}
fetch ftp://ftp.jp.freebsd.org/pub/FreeBSD/ports/ports/ports.tar.gz
tar xzf ports.tar.gz
cd ${PORTSDIR}
fetch http://www.FreeBSD.org/ports/INDEX-9.bz2
bunzip2 INDEX-9.bz2
