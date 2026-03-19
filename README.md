# bc250-performanceprofiles
Easy way to change performance profiles for CPU and GPU overclocking on the BC-250.

This is a simple script to adjust CPU and GPU overclock settings as quickly as possible. (Full disclosure: I did use ChatGPT to produce the first iteration of this script and later Claude to combine them into a single script file)

Dislaimer:  I am not responsible for any harm caused by these scripts and you use them at your own risk.  The 4ghz settings will require adequate cooling.

Requirements:
CPU overclock already installed: https://github.com/bc250-collective/bc250_smu_oc/

GPU overclock already installed: https://github.com/filippor/cyan-skillfish-governor/tree/smu or https://github.com/NexGen-3D-Printing/SteamMachine

Installation:
Download script and place it in home folder.
Set executable in terminal with:
chmod +x overclock_menu.sh

To Run this, open a terminal and type:
./overclock_menu.sh

Running the script from command line will present the following menu:

========================================================
             Performance Profile Menu                   
========================================================

  Performance Presets (CPU + GPU)
  --------------------------------------------------------
   1) High                   — CPU 4 GHz, GPU 2350 MHz — 90°C max overclock
   2) Medium-High            — CPU 3.85 GHz, GPU 2100 MHz — 90°C moderate overclock
   3) Medium-Low             — CPU 3.5 GHz (stock), GPU 2100 MHz — 80°C balanced
   4) Low                    — CPU 3.5 GHz (stock), GPU 2000 MHz — 80°C quiet GPU overclock
   5) Very Low (Stock)       — CPU 3.5 GHz (stock), GPU 1500 MHz — 80°C quiet GPU overclock

   6) Custom                 — Mix and match CPU and GPU profiles independently

   0) Exit

Enter selection (or 0 to exit): 



Optional:
The Decky Terminal plugin allows easy access to this script from game mode.
