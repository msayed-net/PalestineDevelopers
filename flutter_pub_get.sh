cd flutter_packages
for d in */ ; do
    cd $d && flutter pub get && cd ..
done
cd ..