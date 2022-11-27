#!/bin/zsh

#file="./i2.txt"
while read image_with_path; do
    image=$( echo ${image_with_path} | cut -d'/' -f7)
    destination_image=$(echo $image_with_path | cut -d'/' -f4,5,6,7 )
    
    # Check if destination image already exists
    if test -f ${destination_image}
    then
        echo "The file ${destination_image} already exists. Will not copy."
    else 
        #echo "$image"
        all_found=$(find ~/dev -name $image)
        #echo "$all_found"


        largest_size=0
        while IFS= read -r line; do
            #echo "... $line ..."
            size=$(du $line | cut -f1)
            #echo $size
            if test $size -gt $largest_size
            then
                #echo "It's greatest"
                largest_size="$size"
                largest_image="$line"
            fi
        done <<< "$all_found"

        #echo "Largest image found was ${largest_image}: ${largest_size}"
        echo "${largest_image} --> ${destination_image} (${image_with_path})"

        if cp -n ${largest_image} ${destination_image}
        then 
            echo "Copied ${largest_image} successfully."
        else
            echo "Copy of ${largest_image} not successful. (${image_with_path})"
        fi
    fi
    

    #for found in $all_found; do
    #  echo $found
    #  echo $(du ${found})
    #done
   
    #largest=$(${all_found} | xargs -0 du -h {})
    #echo "${largest}"
    #find ~/dev -name XXXXX
    #du -h {} | sort --reverse | head -1
done
#done < "${file}"