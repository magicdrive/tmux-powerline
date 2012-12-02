#!/usr/bin/env bash
# This script prints a string will be evaluated for text attributes (but not shell commands) by tmux. It consists of a bunch of segments that are simple shell scripts/programs that output the information to show. For each segment the desired foreground and background color can be specified as well as what separator to use. The script the glues together these segments dynamically so that if one script suddenly does not output anything (= nothing should be shown) the separator colors will be nicely handled.

# The powerline root directory.
cwd=$(dirname $0)

# Source global configurations.
source "${cwd}/config.sh"

# Source lib functions.
source "${cwd}/lib.sh"

segments_path="${cwd}/${segments_dir}"

# Mute this statusbar?
mute_status_check "right"

# Segment
# Comment/uncomment the register function call to enable or disable a segment.

declare -A pwd
pwd+=(["script"]="${segments_path}/pwd.sh")
pwd+=(["foreground"]="colour211")
pwd+=(["background"]="colour89")
pwd+=(["separator"]="${separator_left_bold}")
#register_segment "pwd"

####declare -A mail_count
####mail_count+=(["script"]="${segments_path}/mail_count_maildir.sh")
#####mail_count+=(["script"]="${segments_path}/mail_count_mbox.sh")
#####mail_count+=(["script"]="${segments_path}/mail_count_gmail.sh")
#####mail_count+=(["script"]="${segments_path}/mail_count_apple_mail.sh")
####mail_count+=(["foreground"]="white")
####mail_count+=(["background"]="red")
####mail_count+=(["separator"]="${separator_left_bold}")
####register_segment "mail_count"

declare -A now_playing
#now_playing+=(["script"]="${segments_path}/np_mpd.sh")
now_playing+=(["script"]="${segments_path}/np_itunes_mac.sh")
#now_playing+=(["script"]="${segments_path}/np_mpd_simple.sh")
#now_playing+=(["script"]="${segments_path}/np_mocp.sh")
#now_playing+=(["script"]="${segments_path}/np_spotify_linux_wine.sh")
#now_playing+=(["script"]="${segments_path}/np_spotify_linux_native.sh")
#now_playing+=(["script"]="${segments_path}/np_spotify_mac")
#now_playing+=(["script"]="${segments_path}/np_rhythmbox.sh")
#now_playing+=(["script"]="${segments_path}/np_banshee.sh")
#now_playing+=(["script"]="${segments_path}/np_audacious.sh")
#now_playing+=(["script"]="${segments_path}/np_lastfm.sh")
#now_playing+=(["script"]="${segments_path}/np_rdio_mac.sh")
#now_playing+=(["script"]="${segments_path}/np_cmus.sh")
if [[ ${now_playing["script"]} ]]; then
	now_playing+=(["foreground"]="colour37")
	now_playing+=(["background"]="colour234")
	now_playing+=(["separator"]="${separator_left_bold}")
    now_playing+=(["separator_fg"]="colour2")
	register_segment "now_playing"
fi

####declare -A cpu
####cpu+=(["script"]="${segments_path}/cpu.sh")
####cpu+=(["foreground"]="colour136")
####cpu+=(["background"]="colour240")
####cpu+=(["separator"]="${separator_left_bold}")
#####register_segment "cpu"

########declare -A load
########load+=(["script"]="${segments_path}/load.sh")
########load+=(["foreground"]="colour167")
########load+=(["background"]="colour237")
########load+=(["separator"]="${separator_left_bold}")
########register_segment "load"
########
########declare -A battery
########if [ "$PLATFORM" == "mac" ]; then
########	battery+=(["script"]="${segments_path}/battery_mac.sh")
########else
########	battery+=(["script"]="${segments_path}/battery.sh")
########fi
########battery+=(["foreground"]="colour127")
########battery+=(["background"]="colour137")
########battery+=(["separator"]="${separator_left_bold}")
#register_segment "battery"

######declare -A weather
######weather+=(["script"]="${segments_path}/weather_yahoo.sh")
#######weather+=(["script"]="${segments_path}/weather_google.sh")
######weather+=(["foreground"]="colour255")
######weather+=(["background"]="colour37")
######weather+=(["separator"]="${separator_left_bold}")
######register_segment "weather"
######
######declare -A xkb_layout
######if [ "$PLATFORM" == "linux" ]; then
######	xkb_layout+=(["script"]="${segments_path}/xkb_layout.sh")
######	xkb_layout+=(["foreground"]="colour117")
######	xkb_layout+=(["background"]="colour125")
######	xkb_layout+=(["separator"]="${separator_left_bold}")
######fi
#######register_segment "xkb_layout"

if [ ${TMUXIP} = 'lan' ];then
    declare -A lan_ip
    lan_ip+=(["script"]="${segments_path}/lan_ip.sh")
    lan_ip+=(["foreground"]="colour70")
    lan_ip+=(["background"]="colour24")
    lan_ip+=(["separator"]="${separator_left_bold}")
    lan_ip+=(["separator_fg"]="white")
    register_segment "lan_ip"
else
    declare -A wan_ip
    wan_ip+=(["script"]="${segments_path}/wan_ip.sh")
    wan_ip+=(["foreground"]="colour70")
    wan_ip+=(["background"]="colour24")
    wan_ip+=(["separator"]="${separator_left_bold}")
    wan_ip+=(["separator_fg"]="white")
    register_segment "wan_ip"
fi

declare -A date_day
date_day+=(["script"]="${segments_path}/date_day.sh")
date_day+=(["foreground"]="colour152")
date_day+=(["background"]="colour24")
date_day+=(["separator"]="${separator_left_bold}")
date_day+=(["separator_fg"]="default")
register_segment "date_day"

declare -A date_full
date_full+=(["script"]="${segments_path}/date_full.sh")
date_full+=(["foreground"]="colour152")
date_full+=(["background"]="colour24")
date_full+=(["separator"]="${separator_left_thin}")
date_full+=(["separator_fg"]="default")
register_segment "date_full"

declare -A time
time+=(["script"]="${segments_path}/time.sh")
#time+=(["foreground"]="colour152")
time+=(["foreground"]="colour152")
time+=(["background"]="colour24")
time+=(["separator"]="${separator_left_thin}")
time+=(["separator_fg"]="default")
register_segment "time"

# Print the status line in the order of registration above.
print_status_line_right

exit 0
