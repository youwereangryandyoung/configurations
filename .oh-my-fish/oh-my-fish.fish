###
# Helper functions
###

function _fish_add_plugin
  set -l plugin $argv[1]
  set -l plugin_path "plugins/$plugin"

  _prepend_path $fish_path/$plugin_path fish_function_path
  _prepend_path $fish_custom/$plugin_path fish_function_path
end

function _fish_add_completion
  set -l plugin $argv[1]
  set -l completion_path "plugins/$plugin/completions"

  _prepend_path $fish_path/$completion_path fish_complete_path
  _prepend_path $fish_custom/$completion_path fish_complete_path
end

function _fish_source_plugin_load_file
  set -l plugin $argv[1]
  set -l load_file_path "plugins/$plugin/$plugin.load"

  if test -e $fish_path/$load_file_path
    . $fish_path/$load_file_path
  end

  if test -e $fish_custom/$load_file_path
    . $fish_custom/$load_file_path
  end
end

function _fish_load_theme
  _prepend_path $fish_path/themes/$fish_theme fish_function_path
  _prepend_path $fish_custom/themes/$fish_theme fish_function_path
end

###
# Configuration
###

# Set fish_custom to the path where your custom config files
# and plugins exists, or else we will use the default custom.
if not set -q fish_custom
  set -g fish_custom  $fish_path/custom
end

# Extracting user's functions – will be added later.
set user_function_path $fish_function_path[1]
set -e fish_function_path[1]

# Add all functions
if not contains $fish_path/functions/ $fish_function_path
  set fish_function_path $fish_path/functions/ $fish_function_path
end

# Add all defined plugins
for plugin in $fish_plugins
  _fish_add_plugin $plugin
  _fish_add_completion $plugin
  _fish_source_plugin_load_file $plugin
end

# Load user defined theme
_fish_load_theme $fish_theme

# Source all files inside custom folder
for config_file in $fish_custom/*.load
  . $config_file
end

# Re-adding user's functions so they have the highest priority
set fish_function_path $user_function_path $fish_function_path

# cnpm alias. npm respository from taobao
function cnpm
    npm --registry=https://registry.npm.taobao.org \
    --cache=$HOME/.npm/.cache/cnpm \
    --disturl=https://npm.taobao.org/dist \
    --userconfig=$HOME/.cnpmrc $argv
end

# proxy and noproxy cmd
function proxy
    set -g http_proxy "http://freespirit:free@code.iyunxiao.com:31280"; \
    set -g HTTPS_PROXY $http_proxy; \
    set -g HTTP_PROXY $http_proxy; \
    set -g FTP_PROXY $http_proxy; \
    set -g https_proxy $http_proxy; \
    set -g ftp_proxy $http_proxy
end

# alias proxy='set -x http_proxy http://code.iyunxiao.com:31280;set -x HTTPS_PROXY $http_proxy;set -x HTTP_PROXY $http_proxy;set -x FTP_PROXY $http_proxy;set -x https_proxy $http_proxy;set -x ftp_proxy $http_proxy;'

function noproxy
    set -e http_proxy
    set -e HTTPS_PROXY
    set -e HTTP_PROXY
    set -e FTP_PROXY
    set -e https_proxy
    set -e ftp_proxy
end

# alias noproxy='set -e http_proxy;set -e HTTPS_PROXY;set -e HTTP_PROXY;set -e FTP_PROXY;set -e https_proxy;set -e ftp_proxy'
