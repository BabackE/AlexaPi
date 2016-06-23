killall python
rm vlc-log.txt
rm tunein.log
rm tmpcontent/*
echo HELLO!
amixer -c 2 set PCM 100%
amixer -c 3 set PCM 100%
#python main_acceldetect_v10.py
python main_cmusphinx_rev4.py
