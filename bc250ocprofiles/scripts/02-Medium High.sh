echo "CPU 3.85ghz, GPU 2100mhz, 80C Moderate Overclock"
sudo cp cpu_overclock_3.85ghz.conf /etc/bc250-smu-oc.conf
sudo systemctl restart bc250-smu-oc.service
sudo cp gpu_overclock_2100mhz.toml /etc/cyan-skillfish-governor-smu/config.toml
sudo systemctl restart cyan-skillfish-governor-smu.service
echo "Done!"
