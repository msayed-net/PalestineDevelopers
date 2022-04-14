cd flutter_packages
for d in */ ; do
    cd $d && flutter clean && cd ..
done
cd ..