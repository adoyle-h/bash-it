#!/usr/bin/env bash

# colored ls
export LSCOLORS='Gxfxcxdxdxegedabagacad'

if [[ -z "$CUSTOM_THEME_DIR" ]]; then
    CUSTOM_THEME_DIR="${BASH_IT_CUSTOM:=${BASH_IT}/custom}/themes"
fi

# Load the theme
if [[ $BASH_IT_THEME ]]; then
    if [[ -f $BASH_IT_THEME ]]; then
        source $BASH_IT_THEME
    elif [[ -f "$CUSTOM_THEME_DIR/$BASH_IT_THEME/$BASH_IT_THEME.theme.bash" ]]; then
        source "$CUSTOM_THEME_DIR/$BASH_IT_THEME/$BASH_IT_THEME.theme.bash"
    else
        # Load colors and helpers first so they can be used in base theme
        # shellcheck source=./themes/colors.theme.bash
        source "${BASH_IT}/themes/colors.theme.bash"
        # shellcheck source=./themes/githelpers.theme.bash
        source "${BASH_IT}/themes/githelpers.theme.bash"
        # shellcheck source=./themes/base.theme.bash
        source "${BASH_IT}/themes/base.theme.bash"
        source "$BASH_IT/themes/$BASH_IT_THEME/$BASH_IT_THEME.theme.bash"
    fi
fi
