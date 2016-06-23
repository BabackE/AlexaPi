killall python
rm vlc-log.txt
rm tunein.log
rm tmpcontent/*
echo HELLO!
amixer -c 2 set PCM 100%
amixer -c 3 set PCM 100%
python main.py
