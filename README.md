# AlexaPi
 
---
 
### Contributors
 
* [Sam Machin](http://sammachin.com)
* [Lenny Shirly](http://github.com/lennysh)
* [dojones1](https://github.com/dojones1)
* [Chris Kennedy](http://ck37.com)
* [Anand](http://padfoot.in)
* [Mason Stone](https://github.com/maso27)
* [Baback Elmieh](http://www.nascentobjects.com)

---
 
This code adapts Sam Machin & Mason Stone's AlexaPi service for use on Nascent Objects modules.
Feedback welcome.

---

Added in this branch:
* Tuned CMU Sphinx Voice Recognition threshold for Nascent objects microphone DSP
* Added silence detection to automatically find end of speech after saying Alexa
* Added Mopidy tuneIn parser to robustly handle the different formats from radiotime.com
* Added volume setting support

### Requirements

You will need:
* A Nascent Main Module
* A Nascent Microphone Module
* A Nascent Speaker Module
* A Modular Shape supporting all 3 modules such as "Cielo" (https://youtu.be/nm0KH_Odq7c)

Next you need to obtain a set of credentials from Amazon to use the Alexa Voice service, login at http://developer.amazon.com and Goto Alexa then Alexa Voice Service
You need to create a new product type as a Device, for the ID use something like AlexaPi, create a new security profile and under the web settings allowed origins put http://localhost:5050 and as a return URL put http://localhost:5050/code you can also create URLs replacing localhost with the IP of your Pi  eg http://192.168.1.123:5050
Make a note of these credentials you will be asked for them during the install process

### Installation

Plug in your nascent main and ssh into the device

Make sure you are in /home/root

Clone this repo to the Pi
`git clone https://github.com/BabackE/AlexaPi.git
Run the setup script
`./setup.sh`

Follow instructions....

Enjoy :)

### Advanced Install

For those of you that prefer to install the code manually or tweak things here's a few pointers...

The Amazon AVS credentials are stored in a file called creds.py which is used by auth_web.py and main.py, there is an example with blank values.

The auth_web.py is a simple web server to generate the refresh token via oAuth to the amazon users account, it then appends this to creds.py and displays it on the browser.

main.py is the 'main' alexa client it simply runs on a while True loop waiting either the trigger word "Alexa," or for the button to be pressed. It then records audio and will detect the end of your speech once you stop speaking for ~1 second (silence detection) it posts this to the AVS service using the requests library, When the response comes back it is played back using vlc via an os system call. 

The internet_on() routine is testing the connection to the Amazon auth server as I found that running the script on boot it was failing due to the network not being fully established so this will keep it retrying until it can make contact before getting the auth token.

The auth token is generated from the request_token the auth_token is then stored in a local memcache with and expiry of just under an hour to align with the validity at Amazon, if the function fails to get an access_token from memcache it will then request a new one from Amazon using the refresh token.








---
 

