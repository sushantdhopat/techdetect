#!/bin/bash

target=$1
mkdir withcdn

cat $target | nuclei -tags akamai,cdn,aws,amazon,cloudfront,secui | tee withcdn/cdn.txt
cat withcdn/cdn.txt | grep -Eo 'https?://[^/[:space:]]+\.[a-zA-Z]+' | sort -u >> withcdn/nucdn.txt
rm withcdn/cdn.txt

webanalyze -hosts $target | tee withcdn/wappy.txt

awk '/https:\/\// {domain=$1} /Akamai/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Cloudflare/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Fastly/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /StackPath/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Amazon CloudFront/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Google Cloud CDN/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /KeyCDN/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /CDN77/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Imperva/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /MaxCDN/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /BunnyCDN/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /CacheFly/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /CloudFront/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Alibaba Cloud CDN/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Microsoft Azure CDN/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Cloudflare WAF/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Akamai Kona Site Defender/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Sucuri WAF/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /AWS WAF/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /F5 BIG-IP/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /ModSecurity/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Imperva Incapsula/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /FortiWeb/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Barracuda WAF/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt
awk '/https:\/\// {domain=$1} /Edgecast/ {print domain}' withcdn/wappy.txt >> withcdn/cdn.txt

#now finding templates engines for the template injection

awk '/https:\/\// {domain=$1} /Jinja2/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Twig/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /FreeMarker/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Apache Velocity/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Thymeleaf/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Handlebars/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Mustache/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Smarty/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /EJS/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Mako/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Django/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Liquid/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Ruby on Rails/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Laravel/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Pug/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Pebble Templates/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /ASP.NET/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Razor/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /ColdFusion/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Tornado/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Nunjucks/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /doT/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Slim/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt
awk '/https:\/\// {domain=$1} /Dust/ {print domain}' withcdn/wappy.txt >> withcdn/temp.txt

rm withcdn/wappy.txt
cat withcdn/nucdn.txt withcdn/cdn.txt >> withcdn/newcdn.txt
rm withcdn/nucdn.txt withcdn/cdn.txt
cat withcdn/newcdn.txt | sort -u | tee withcdn/withcdns.txt
cat withcdn/temp.txt | sort -u | tee withcdn/withtemp.txt
rm withcdn/newcdn.txt withcdn/temp.txt
