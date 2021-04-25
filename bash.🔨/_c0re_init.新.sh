#!/bin/bash

## * * * * * * * * * * * \\
#*
#* Purpose: ⚠️ 
#* THIS IS AN EXAMPLE/TEMPLATE! (code in here doesn't run)
#* 
## * * * * * * * * * * * //

#Q: When should you use Bash arrays instead of other 
#scripting languages such as Python?
#A: Dependencies vs. Size & Execution Speed
 
#* 进口v2 🥾 ALWAYS load c0re Libraries!
source "../_b00t_.bashrc"
_b00t_init_🥾_开始


# README / bash scripting tips: 

# Bats: Bash Automated Testing System
# https://github.com/sstephenson/bats


# String Library
# https://github.com/zombieleet/bashify

# Bash Arrays
# @ means "all" elements
# 🍰 https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays
allThreads=(1 2 4 8 16 32 64 128)
for t in ${allThreads[@]}; do
  ./command --threads $t
done

# Retrieve output of a Bash command
output=$( ./my_script.sh )

# Retrieve the output of a Json File (using JQ)
arr=( $(jq -r '.[].item2' json) )
printf '%s\n' "${arr[@]}"

## Bash Array Syntax:
arr=()	Create an empty array
arr=(1 2 3)	Initialize array
${arr[2]}	Retrieve third element
${arr[@]}	Retrieve all elements
${!arr[@]}	Retrieve array indices
${#arr[@]}	Calculate array size
arr[0]=3	Overwrite 1st element
arr+=(4)	Append value(s)
str=$(ls)	Save ls output as a string
arr=( $(ls) )	Save ls output as an array of files
${arr[@]:s:n}	Retrieve n elements starting at index s


## * * * * \\
# Example Function
my_function () {
  echo "some result"
  return 55
}
my_function
echo $?
## * * * * //


## * * * * \\
# Get filename and --parameters
filename=$1
while getopts ":g:i:n:m:e:" arg; do
  case $arg in
    g) resourceGroup=$OPTARG;;
    i) ID=$OPTARG;;
    n) Name=$OPTARG;;
    m) Manufacturing_date=$OPTARG;;
    e) Expire_date=$OPTARG;;
  esac
done
echo -e "\n$ID $Name\n"
# ./bash-cmd.新.sh -g -i p001 -n 'Hot Cake' -m '01-01-2018' -e '06-01-2018'
## * * * * //


function_name () {
  commands
}



