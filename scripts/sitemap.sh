#!/bin/bash
header='<?xml version="1.0" encoding="UTF-8"?><urlset
      xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9
            http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd">' 
echo $header > sitemap.xml

LIST=$(find . -type f -name "*.md")

for path in ${LIST[@]};do
  if [[ $path == *"node_module"* ]];then
    continue
  fi

  lastmod=$(stat -f "%Sm" -t "%F" "${path}")
  path=$(echo ${path} | sed 's#./##')
  echo "<url><loc>https://blog.jiapan.tw/${path}</loc><lastmod>${lastmod}</lastmod></url>" >> sitemap.xml
done
echo "</urlset>" >> sitemap.xml

