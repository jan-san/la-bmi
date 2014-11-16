---
title       : Latitude-adjusted Body Mass Index (LA-BMI) Calculator
subtitle    : 
author      : Jan Hagelauer
date        : 2014-11-17
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : [mathjax]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Motivation

John D. is travelling to Tromsø (N69.648787, E18.954408). According to the scale in the hotel, he weighs 80.9 kg. At 1,80m, this leaves him with a BMI of 24.97. John is very happy finally having achieved normal weight and decides to go feasting tonight.

**What John doesn't know:** the scale he used is adjusted for standard gravity. His actual weight is 81.06 kg, and his actual BMI 25.02, meaning that he is still overweight.

**The latitude-adjusted Body Mass Index calculator can help avoid unfounded feasting!**

--- .class #id 

## Why latitude-adjustment is necessary

**Gravity** is not the constant across the globe. The two main factors influencing local gravity are:
- variation in the *centrifugal force* resulting from the earth's rotation 
- the *equatorial bulge* (the earth's greater diameter at the equator compared to the poles)

These two factors are dependent on the location's *latitude* and can result in deviations of the local gravity from the standard gravity of up to 0.5%.

--- .class #id 

## Gravity and weight

Electronic scales measure the **force** applied by the measured object to the scale's surface.
This force ($F$) is directly proportional to the object's mass ($m$) and the local gravity ($g$):

$F = m \cdot g$

The variability of local gravity on earth therefore results in a measurement error of electronic scales.

--- .class #id 

## Completely unrelated plot

The following plot was merely put into this presentation to fully comply with Coursera's grading requirements.

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1.png) 
