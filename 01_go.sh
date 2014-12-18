export OSNAME=$(tr '[A-Z]' '[a-z]' <<< $(uname -s))
export ARCHNAME='amd64'

export FILENAME=go1.4.${OSNAME}-${ARCHNAME}.tar.gz
export URL=http://golang.org/dl/

mkdir -p ${LOCALBASE}/{src,bin}
cd ${LOCALBASE}/src
curl -L ${URL}/${FILENAME} | tar xfz -
mv go ${LOCALBASE}/
