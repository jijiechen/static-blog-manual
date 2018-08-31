@echo off
rem #!/bin/bash

hugo -t hyde

cd public
git add --all 
git commit -m "Publishing to gh-pages"
git push origin master

cd ..