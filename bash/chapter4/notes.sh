#!/bin/bash

# Enclosing a referenced value (a variable) in double quotes ("") does not interfere with variable substitution.
# This is called partial quoting, sometimes referred to as "weak quoting"
# Using single quotes causes the variable name to be used literally, and no substituion will take place. 
# This is full quoting, sometimes referred to as 'Strong Quoting.'

#  $variable is a simplified alternate form of ${variable} 

a=35
home=$a
strong='$a' # strong quoting, variable name will be taken literally as string
weak="$a" # weak quoting, variable name used as reference

echo $a;
echo $home;
echo "${strong}"; # quoting a variable preserves whitespace ------- IMPORTANT!!!!
echo $weak;

# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
# It is permissible to set multiple variables on the same line,
#+ if separated by white space.
# Caution, this may reduce legibility, and may not be portable.
var1=21 var2=22 var3=$V3
echo
echo "var1=$var1 var2=$var2 var3=$var3"
# May cause problems with older versions of "sh".
# −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−
echo; echo
numbers="one two three"
# ^ ^
other_numbers="1 2 3"
# ^ ^
# If there is whitespace embedded within a variable,
#+ then quotes are necessary.
echo "numbers = $numbers"
echo "other_numbers = $other_numbers" # other_numbers = 1 2 3
echo
echo "uninitialized_variable = $uninitialized_variable"

let a=1

echo a;

# In a 'read' statement (also a type of assignment):
echo −n "Enter \"a\" "
read a
echo "The value of \"a\" is now $a."

# Now, getting a little bit fancier (command substitution).
a=`echo Hello!` # Assigns result of 'echo' command to 'a'
echo $a

a=`ls −ltr` # Assigns result of 'ls −l' command to 'a'
echo $a # Unquoted, however, removes tabs and newlines.
echo
echo "$a" # The quoted variable preserves whitespace.
 # (See the chapter on "Quoting.")
exit 0

