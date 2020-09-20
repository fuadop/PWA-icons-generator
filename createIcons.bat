@echo off
title Icon Generator

:start

echo .
echo .
echo .

echo ======================PWA Icons Generator=======================================================
echo =================Note: To use this script you must have imageMagick installed and added to your PATH===================

echo .
echo .

rem image path address
echo Enter full path to the image you want to generate icons for (eg. C:\Users\downloads\icon.png):
echo .
set /p image_path=">>> "

echo .
echo .

rem project folder address
echo Enter full path to your project folder (eg. C:\Users\desktop):
echo .
set /p folder_path=">>> "

if not exist %folder_path%\ (
    echo Not a valid folder path: %folder_path%
    goto :start
) else (
    cd %folder_path% 
    mkdir images 
    cd images 
    mkdir icons 
    cd icons
)

if not exist %image_path% (
    echo Not a valid image path: %image_path%
    goto :start
) else (
    if exist %folder_path% (
        echo ===============================Generating=============================
        magick convert %image_path% -resize 72x72 icon-72x72.png && echo icon-72x72 generated
        magick convert %image_path% -resize 96x96 icon-96x96.png && echo icon-96x96 generated
        magick convert %image_path% -resize 128x128 icon-128x128.png && echo icon-128x128 generated
        magick convert %image_path% -resize 144x144 icon-144x144.png && echo icon-144x144 generated
        magick convert %image_path% -resize 152x152 icon-152x152.png && echo icon-152x152 generated
        magick convert %image_path% -resize 192x192 icon-192x192.png && echo icon-192x192 generated
        magick convert %image_path% -resize 384x384 icon-384x384.png && echo icon-384x384 generated
        magick convert %image_path% -resize 512x512 icon-512x512.png && echo icon-512x512 generated
        magick convert %image_path% -resize 16x16 favicon.ico && echo favicon generated

        goto :end
    )
) || (
    echo .
    echo Not a valid image path: %image_path%
    goto :start
)

:end
set /p response=Do you want to continue for another image? (Y/N) 
if %response% equ Y (
    goto :start
) else (
    pause
)