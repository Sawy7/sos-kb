#!/bin/bash

function make_dirs() {
        for i in $1
        do
                mkdir -p "/opt/SOS/$i"
        done
}

function uno() {
        ls_output=$(ssh nem0215@linedu.vsb.cz "ls /home/fei" | grep 00)
        make_dirs "${ls_output[@]}"
}

function dos() {
        web_output=$(GET http://seidl.cs.vsb.cz/download/seznam-obci-cr.txt | grep ova | grep -v Nova | sed -e "s/ /_/g")
        make_dirs "${web_output[@]}"
}

function tres() {
        web_output=$(GET http://seidl.cs.vsb.cz/download/obce_psc.csv.txt | cut -d "," -f 1-2 | grep -o "[0-9]*5[0-9]*,.*" | sed "s/ /_/g;s/[0-9]*,//g")
        make_dirs "${web_output[@]}"
}

function cuatro() {
        web_output=$(GET http://seidl.cs.vsb.cz/download/posty.csv.txt | cut -d ";" -f 1,4 | grep ".*;\"[0-9]*5[0-9]*\"" | grep -v ".*55.*" | sed "s/\"//g;s/;.*//g;s/ /_/g")
        make_dirs "${web_output[@]}"
}

function cinco() {
        web_output=$(GET http://seidl.cs.vsb.cz/download/posty.csv.txt | cut -d ";" -f 1,3 | grep ".*;.*\/.*" |  grep -v ".*;.*s\|S.*" | sed "s/\"//g;s/;.*//g;s/ /_/g")
        make_dirs "${web_output[@]}"
}

cinco