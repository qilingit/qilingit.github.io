#!/bin/bash
#
# This file is taken from: https://github.com/mincong-h/mincong-h.github.io/blob/master/newpost.sh
#   This script creates a new blog post with metadata in ./_posts
#   folder. Date will be generated according to the current time 
#   in the system. Usage: 
#   
#       ./newpost.sh My Blog Post Title

title="${*:1}"

if [[ -z "$title" ]]; then
    echo 'usage: ./newpost.sh My New Blog Title'
    exit 1
fi

bloghome=$(cd "$(dirname "$0")" || exit; pwd)
url=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
filename="$(date +"%Y-%m-%d")-$url.md"
filepath="$bloghome/_posts/$filename"

if [[ -f "$filepath" ]]; then
    echo "$filepath already exists."
    exit 1
fi

cat << EOF >> "$filepath"
---
layout:         post
title:          $title
date:           $(date +"%Y-%m-%d %H:%M:%S %z")
categories:     [tech]
tags:           []
comments:       true
excerpt:        >
    TODO
image:          /assets/bg-coffee-84624_1280.jpg
ads:            none
---

## Introduction
Explain context here...
and why it is important to understand this topic (motivation) ?

After reading this article, you will understand:

## Going further

How to go further from here ?

## Conclusion

## References

EOF

echo "Blog created: $filepath"