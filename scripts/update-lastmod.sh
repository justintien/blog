# (deprecated)... haha change file, the lastmod also changed.
# #!/bin/bash
# LIST=$(find . -type f -name "*.md")

# for path in ${LIST[@]};do
#   lastmod=$(stat -f "%Sm" -t "%F" "${path}")
#   # first line
#   headN1=$(head -n 1 ${path} | sed -e "s/Last-Modified.*/{lastmod}/")
  
#   if [[ ${headN1} = "{lastmod}" ]]; then
#     sed -i "" "s#Last-Modified.*#Last-Modified: ${lastmod}#" ${path}
#   else
#     echo 'TODO'
#   fi
# done
