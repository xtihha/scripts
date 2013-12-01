#!/bin/bash
function checkgit(){
    for subdir in `ls -a $1`
        do
            if [ $subdir = ".git" ]; then
                echo $1" is a git project"
                return 1
            fi
        done
    return 0
}
function pull(){
    #echo "13 $1"
    if [ -d "$1/.git/refs/heads" ];then
        for br in `ls $1/.git/refs/heads`
            do
                echo $1 "has branch" $br
                cd $1
                git co $br
                git pull
                cd -
            done
    fi
}

function listdirs(){
    #echo "25 $1"
    for file in `ls $1`
        do
            if [ -d $1/$file ]; then
                checkgit $1/$file
                result=$?
                if [ $result -ne 0 ]; then
                    pull "$1/$file"
                else
                    echo $1/$file "is not a git project"
                    listdirs $1/$file
                fi
            fi
        done
}

listdirs .

