+++
title ="Trials and Tribulations Using Facedetect on Texas Instrument LCDK OMAP-L138"
menu = ""
Categories = []
Tags = []
Description = "Things I have learned from doing a project on TI LCDK"
date = "2017-04-05T22:16:26-07:00"

+++
## A Digital Signal Processing Project

### How to Use This Post
There is a lot of content. I recommend skimming the document to get an idea of what might be useful as pertains to your project.

### Note  
This document references OpenCV 1.x. Here is the [reference manual](/file/cv1x.pdf). As of writing, it is an old version, but we used it because TI StarterWare's Facedetect demo uses this. It will require more advanced knowledge to try and use a newer verson of OpenCV as this involves compiling from source to the ARM processor in your LCDK. More at the end of the guid

**Don't be afraid of the complexity of the demo**  
The code is complicated, but you don't have to know every part in order to do the project well. It is too easy to get sucked into the void of trying to understand everything. Use the reference manual that comes with the class. You are only going to be interested in certain interrupts and tasks because that is where the magic happens. The document explains it decent, but here is my take to give you a little more. Anything with Setup in the name you can ignore.

* main() is just setup for the program, you won't need to mess with it.
* facedetectTask is where the detection actually happens.
* LCDIsr is the interrupt service routine to draw to the output. Edit this to have different outputs.


**Yes it takes a long time to build and run**  
_The only thing you can do is be efficient with your time_  
One thing I noticed with the LCDK CCS setup is that every time you make a change to the code and want to test it out, you will have to wait at least a couple of minutes. This is extremely frustrating when you are trying to work fast, but it is a limitation that we can't avoid without a lot of research. What I did to max

**Detect Circles**  
_One line of code will allow you to detect circles instead._  
So you've got it working. Now let us change it to detect circles and give you a taste that changing the code is not as hard as it seems. Go to facedetectTask and comment out the Haar detection line. We will replace it with an included function in OpenCV.

```
/* Apply OpenCV haardetect algorithm */
//dsp_sequence = cvHaarDetectObjects(image, cascade, storage, 2.5, 2, 0,cvSize(30, 30));

/* Apply OpenCV Hough Circles algorithm */  
dsp_sequence = cvHoughCircles(image, storage, CV_HOUGH_GRADIENT, 2, image->width/6, 100, 50, 0, 0);
```

cvHoughCircles uses a transform on the image to detect circles. There are multiple parameters to the function which you can change. Try the ones I have here to start and reference the manual to play with it yourself. Note that the program will crash if it detects too many circles at once. We also have to draw the circles to the output. Remember that this involves editing LCDIsr. My code is below. Thanks to Aditya Kotte who pioneered this.

```
c = (float *) cvGetSeqElem(dsp_sequence2, i);
CvPoint pt = cvPoint(cvRound(c[0]), cvRound(c[1]));
int radius = cvRound(c[2]);
cvCircle(image1, pt, radius, blue, 2, 8, 0);
```

**Using custom HaarClassifier Cascades**  
_Loading your own HaarClassifier is very difficult_  
You will not be able to cvLoad a new HaarClassifierCascade.xml easily. I ran into very cryptic errors when trying to do this that would require a very deep understanding of the LCDK OMAPL138 to fix.

The facedetect uses HaarClassifier Cascades to do their facedetect. This is stored in a variable called buffer as an array of ints. Somehow they converted the .xml file into data that would go into memory and hardcoded it.

**Trying to Use Newer OpenCV**
_Research ARM-EABI cross compile OpenCV_
This will point you in the right direction. If you are not a computer science major, you may not understand what this means. That's okay, I didn't either, we are here to learn. Here's the lowdown to get you started on how to learn it. Two major instruction sets are x86 and ARM. When we write programs in any code, they are compiled so that they become machine instructions that the CPU can read them. We have the source for OpenCV on the internet, easily accessible. The LCDK uses an ARM chip. It is embedded, so there is no operating system on the LCDK (well technically there is a BIOS, which I'm actually not sure how that will affect). But we want EABI (Embedded Application Binary Interface - ABI's are a whole other topic). If there was an operating system, there would be a need to compile for the different operating systems as well (Linux, Windows, MacOS being the major ones). Each operating system has different requirements for executables, and you also knew the hardware does too. Confusing I know. If you actually complete this please contact me! I would love to know. Then cross compiling is just the term we use when we want to compile a program for different platforms.

**Where to Put Your Project File**  
_Having the working project file in your flashdrive will ensure nothing gets changed._  
Save your CCS project on your flashdrive. This will prevent the host computer changes in between your sessions to affect your project. Your project will still reference library files located on the computer.

You might get some error with missing GEL files or missing dependencies. This is okay. The GUI for CCS is nice enough that you can click through it and it will let you find your file. When you installed the Starterware, it should have downloaded other dependencies in the Program Files -> Texas Instruments (or ti) folder. One of them is **pdk_C6748_2_0_0_0**. The error in CCS should tell you. Actually what I did is I just copied the dependencies needed into the same project folder on my flash so that it would contain the full set of files needed.

**Manipulating CvSequence**  
_Understand that sequences are linked lists_  
This is a confusing structure because some of OpenCV's structs are made from sequences, but you can also use a sequence to hold things. How it relates to you is that if you are using findContours, then a sequence of contours is returned. Then also note that contours are sequence of points. Here is a quick example of how to access the points in the sequence

```
for(current=dsp_sequence; current != NULL; current=current->h_next) {
	for(j=0; j < current->total; j++) {
		CvPoint* pt = (CvPoint*)cvGetSeqElem(dsp_sequence,j);
		printf("   hello the (x,y) is : (%d, %d)\n",pt->x,pt->y);
```

The outer loop traverses the sequence of contours(which are also cvSequences). The inner loop will traverse the points of that contour. Notice that I use a typcast to CvPpoint when I use cvGetSeqElem and store it in a temporary CvPoint. This typcast is needed. You can refer to the manual for more info. Which leads into the next tip.

Note that OpenCV defines many objects themselves. Look at the manual to see. There are cvPoints, cvFonts, and more.

**Refer to source code**  
_The manual is not 100% accurate, so you will need your C knowledge to infer_  
When the manual is wrong. Right-click and use open function declaration in order to inspect the source code. This is a neat tool provided by CCS that will automatically open the file and display the function. This is most useful when figuring out what arguments to pass into the function.

**Doing Image Processing**  
_An easier project is to do image processing, but you will need to make changes_  
You will need to include highgui.lib if you want to load and save images. For some reason this library was not built into the facedetect demo. Thhe reasoning is probably because facedetect doesn't use any of the functions from it. Andrew Ho has built a highgui.lib from source that you can just include in your project. Do it by placing the file in your /bin folder of the project folder and then going to project properties going to C6000 linker. Then actually include it in your main c file with

```
#include "highgui.h"
```
You may also need the highgui.h header file from the source code. But you can get that from SourceForge. Here is the file for the [highgui.lib](/file/highgui.lib) file.

![highgui.lib bin folder placement](/image/highgui.PNG)  
_Image: Shows where exactly to put the lib file in your project folder._

**Loading and Saving Images**  
_Use cvLoadImage and cvSaveImage._  
cvLoadImage will allow you to load bmp images. If you are doing it in Paint, save them as 256-bit images. Note that this does take a long time for any appreciably sized images. Just note to use the correct path. Debugging which path to use took me a couple of hours.

```
const char* source = "C:/Users/EE113D/Desktop/template.bmp";
IplImage * image = cvLoadImage(source, CV_LOAD_IMAGE_COLOR);
//the second parameter to the function in all CAPS is just to let the program know the file is a 256-bit color image. You will need that
```

cvSaveImage will allow you to save any IplImage or cvMat as a bmp image back onto your desktop. This is useful for actually seeing what the function are doing to the image. In fact, I would say that this is a vital step. Research a bit how the function is implemented and then 

```
cvSaveImage("C:/Users/EE113D/Desktop/edged.bmp", gray);
//gray is just the name of the IplImage I wanted to save
```

**You can't use printf in Facedetect Video Processing**  
_printf is too slow and messes up the interrupts in video processing_  
Another advantage of the doing images is that you can actually do printf to the console that is convenently located in CCS. If you try to do it with the video processing, your program will break. Feel free to try it.

**IplImage and CvMat**  
They can both be used as images. IplImage if you google is just a wrapper to hold an image. cvMat will be more basic. You may use either, but stick to one. Refer to the manual for information.

**Useful Image Filters**  
You will want to use grayscale, edge, and smooth filters if you are doing any sort of image processing. Below are details on how to use them.

TODO

**Speeding up cvLoad**  
_Overall_  
* cvLoad takes too long to load images.

* Use Python Script to turn bmp images into C byte array fast.

* Add this to the project.

_Details_  
You will notice that cvLoad takes a boatload of time to load images. For our project I had about 100x100 pixels and it would still take a couple of minutes. When you want to do real processing this is not going to be practical on real images. Kevin Balke wrote an awesome script that basically parses file into a C language static byte array. Supposedly the cvLoad does the same thing when it is loading bmp files. So instead of waiting for the program to locate the file on your local computer and slowly reading it in, we can use the python script to do this conversion for us first. Note that I personally did not have enough time to implement this into my project, so you may have to work out the smaller bugs yourself.

_Detailed Steps_ provided by Kevin Balke

1. Download python 2.7 from python.org and install

2. Add [filetoc.py](/file/filetoc.py) to project

3. Add image file to project

4. Under Project Properties -> Build -> Steps -> Pre-build steps:
Enter into Command:

5. @C:\Python27\python ${PWD}\..\filetoc.py -f ${PWD}\..\image.bmp -o ${PWD}\..\image -n image

6. Replace bmp.h with modified copy to add imread_const

_Notes on step 6_  
If you are using IplImage, it is a wrapper around the actual data of the image. What you should do is declare your own image and then manually populate the values that it requires. This is where your C skills come in. You will find that somewhere in the IplImage struct, there is a place for the data of the image. Save the results of filetoc.py as a variable and populate you IplImage with that.

As I recall Kevin did recommend PILLOW, an active fork of PIL (Python Imaging Library) that you may need. Again, as I didn't actually implement this step, I am just trying to prepare you for possible tools you will need.

