cd ${LOCALBASE}/src
curl -L https://pypi.python.org/packages/source/v/virtualenv/virtualenv-1.11.6.tar.gz | tar xfz -
cd virtualenv-1.11.6
python setup.py build
mv build/lib/* ${LOCALBASE}/bin
chmod +x ${LOCALBASE}/bin/virtualenv.py
