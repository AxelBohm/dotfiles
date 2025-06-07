#!/bin/bash

brightnessctl s 10-

kill -35 $(pidof dwmblocks)
