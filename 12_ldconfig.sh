ldconfig -r | awk '/search/ {print $3}' | tr ":" "\n" > ${LOCALBASE}/etc/ld-elf.so.conf
echo ${LOCALBASE}/lib >> ${LOCALBASE}/etc/ld-elf.so.conf
