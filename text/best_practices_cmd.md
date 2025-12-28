# Introduction

This document describes an advanced workflow for working with pixel art and image manipulation tasks such as slicing sprite sheets, removing backgrounds, and creating GIFs, without using graphical editing software like Paint.NET or GIMP.

All of these tasks are performed using ImageMagick, a powerful command-line image processing tool. By automating repetitive steps with scripts, the workflow becomes faster and more consistent, eliminating the need for slow manual operations. This document explains how ImageMagick is used and describes my personal workflow.

# ImageMagick

ImageMagick operates through command-line commands and scripts rather than a graphical user interface. I have created several reusable scripts that automate common image manipulation tasks used when working with pixel art.

Before following this guide, make sure ImageMagick is installed on your system.

# Using the scripts

Each script is designed to work by dragging a sprite image file onto a .cmd script file. The script then processes the image automatically using predefined settings.

The folder contains several ready-to-use scripts. You can move or copy the .cmd files to any location you prefer, or use them directly from their current folder.

You can inspect any script by right-clicking it and opening it in a text editor. The scripts are easy to modify and can be customized to suit your needs, such as changing the frame size, output file naming pattern, output folder, or other parameters.
