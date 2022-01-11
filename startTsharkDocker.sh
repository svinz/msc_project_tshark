docker run \
-v $PWD/captures:/data \
-v $PWD/old_pcaps:/old_pcaps \
-v /home/pi/onboardunit/sslkeylog:/sslkeylog \
-v $PWD/elastic_decrypted:/elastic \
-v $PWD/shellscripts:/shellscripts \
--rm -ti registry.gitlab.com/svinz2/nwixn-tshark:master \
/bin/sh -c "sh /shellscripts/tshark_decrypt.sh"

