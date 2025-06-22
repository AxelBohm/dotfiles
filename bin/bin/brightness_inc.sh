#!/bin/bash

brightnessctl s 15+ 

kill -35 $(pidof dwmblocks)
