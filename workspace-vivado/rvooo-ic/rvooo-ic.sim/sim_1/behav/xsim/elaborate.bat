@echo off
REM ****************************************************************************
REM Vivado (TM) v2024.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : AMD Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu Feb 27 19:40:34 -0600 2025
REM SW Build 5239630 on Fri Nov 08 22:35:27 MST 2024
REM
REM Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
REM Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_mux4_n_behav xil_defaultlib.tb_mux4_n xil_defaultlib.glbl -log elaborate.log"
call xelab  --incr --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot tb_mux4_n_behav xil_defaultlib.tb_mux4_n xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
