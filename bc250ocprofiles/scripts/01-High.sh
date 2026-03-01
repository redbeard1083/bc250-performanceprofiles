echo "CPU 4ghz, GPU 2350mhz, 90C Max Overclock"
sudo cp cpu_overclock_4ghz.conf /etc/bc250-smu-oc.conf
sudo systemctl restart bc250-smu-oc.service
sudo cp gpu_overclock_2350mhz.toml /etc/cyan-skillfish-governor-smu/config.toml
sudo systemctl restart cyan-skillfish-governor-smu.service
echo "Done!"
