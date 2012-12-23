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

declare -A prefix
prefix+=(["script"]="${segments_path}/tmux_prefix.sh")
prefix+=(["foreground"]="colour0")
prefix+=(["background"]="colour145")
prefix+=(["separator"]="${separator_left_bold}")
register_segment "prefix"

declare -A weather
weather+=(["script"]="${segments_path}/weather_yahoo.sh")
#weather+=(["script"]="${segments_path}/weather_google.sh")
weather+=(["foreground"]="colour255,bold")
weather+=(["background"]="colour79")
weather+=(["separator"]="${separator_left_bold}")
register_segment "weather"

declare -A date_day
date_day+=(["script"]="${segments_path}/date_day.sh")
date_day+=(["foreground"]="colour152,bold")
date_day+=(["background"]="colour8")
date_day+=(["separator"]="${separator_left_bold}")
date_day+=(["separator_fg"]="colour8")
register_segment "date_day"

declare -A date_full
date_full+=(["script"]="${segments_path}/date_full.sh")
date_full+=(["foreground"]="colour152")
date_full+=(["background"]="colour8")
date_full+=(["separator"]="${separator_left_thin}")
date_full+=(["separator_fg"]="colour152")
register_segment "date_full"

declare -A time
time+=(["script"]="${segments_path}/time.sh")
time+=(["foreground"]="colour152")
time+=(["background"]="colour8")
time+=(["separator"]="${separator_left_thin}")
time+=(["separator_fg"]="colour152")
register_segment "time"

# Print the status line in the order of registration above.
print_status_line_right

exit 0
