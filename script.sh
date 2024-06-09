echo 'Signing keys...'

subject='/C=PH/ST=Manila/L=Philippines/O=The Scape/OU=The Scape/CN=The Scape/emailAddress=lqlp0011@gmail.com'
mkdir ~/.android-certs

for x in releasekey platform shared media networkstack testkey cyngn-priv-app bluetooth sdk_sandbox verifiedboot; do \
    ./development/tools/make_key ~/.android-certs/$x "$subject"; \
done

mkdir vendor/droidx-priv
mv ~/.android-certs vendor/droidx-priv/keys
echo "PRODUCT_DEFAULT_DEV_CERTIFICATE := vendor/droidx-priv/keys/releasekey" > vendor/extra/product.mk
