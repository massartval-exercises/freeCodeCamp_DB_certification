#!/bin/bash
# translate "cat" to "dog" and "meow/meowzer" to "woof"
cat $1 | sed -E 's/catnip/dogchow/g;s/cat/dog/g;s/meow|meowzer/woof/g' 