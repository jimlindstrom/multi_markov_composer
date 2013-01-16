#!/bin/sh

for i in `find | grep 'mid$'` ; do ./parse.rb $i ;done >> vectors.rb
