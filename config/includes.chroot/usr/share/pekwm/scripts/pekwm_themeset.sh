#!/bin/bash
#
# Copyright © 2003-2009 the pekwm development team
#
# Add this to your menu to use this script:
#
# SubMenu = "Themes" {
#   Entry { Actions = "Dynamic /path/to/this/file /path/to/themedir" }
# }
#

# Check usage
if test -z "${1}"; then
    echo "usage: $0 /path/to/themedir (theme)";
    exit 1
fi

if test -z "${2}"; then
    theme_dir="${1}"

    echo "Dynamic {"

    # Check that theme directory exists, if it does not exist create a
    # dummy entry that says the dir does not exist.
    if test -d "${theme_dir}"; then
        ( cd ${theme_dir};
          for theme_name in *; do
            # Themes must be directories. This test also prevents * globbing
            # problems if theme_dir is empty.
            if test -d "${theme_name}"; then
                theme_path="${theme_dir}/${theme_name}"
                echo "Entry = \"${theme_name}\" { Actions = \"Exec ${0} ${1} ${theme_path}\" }"
            fi
          done )
    else
        echo "Entry = \"No such directory ${theme_dir}\" { Actions = \"None\" }"
    fi

    echo "}"

else
    # Check for configuration file, if the environment is not set the
    # script is not being run from pekwm, then exit with failure.
    if test -f "${PEKWM_CONFIG_FILE}"; then
        theme="$(echo "${2}" | /bin/sed -e "s@^${HOME}@~@" | /bin/sed -e 's/\//\\\//g')"

        # Get temporary file, not all platforms have mktemp though
        if test -x "/bin/mktemp"; then
            tmp_file=$(mktemp -t pekwm_themeset.XXXXXX) || exit 1;
        else
            tmp_file="/tmp/pekwm_themeset.${USER}"
        fi

        # Change theme
        /bin/sed -e "s/^\([^#]*\)[Tt][Hh][Ee][Mm][Ee]\ =\ \"[^\"]*\"/\\1Theme\ =\ \"${theme}\"/" "${PEKWM_CONFIG_FILE}" > "${tmp_file}"
        mv "${tmp_file}" "${PEKWM_CONFIG_FILE}"

        # Reload pekwm
        kill -HUP $(xprop -root _NET_WM_PID | awk '/_NET_WM_PID/ { print $3 }')
    else
        exit 1
    fi
fi

exit 0
