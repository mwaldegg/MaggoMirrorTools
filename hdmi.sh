#!/bin/sh

# Enable and disable HDMI output on the Raspberry Pi

is_off ()
{
        #tvservice -s | grep "TV is off" >/dev/null
        /usr/bin/vcgencmd display_power | grep "display_power=0" >/dev/null
}

case $1 in
        off)
                #tvservice -o
                /usr/bin/vcgencmd display_power 0
        ;;
        on)
                if is_off
                then
                        #tvservice -p
                        #fbset -depth 8
                        #fbset -depth 16
                        /usr/bin/vcgencmd display_power 1
                fi
        ;;
        status)
                if is_off
                then
                        echo OFF
                else
                        echo ON
                fi
        ;;
        *)
                echo "Usage: $0 on|off|status" >&2
                exit 2
        ;;
esac

exit 0


