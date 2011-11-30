#compdef jenkins
#autoload

# Jenkins CLI zsh integration

local -a _1st_arguments
_1st_arguments=(
'build:Builds a job, and optionally waits until its completion.'
'cancel-quiet-down:Cancel the effect of the "quiet-down" command.'
'clear-queue:Clears the build queue'
'connect-node:Reconnect to a node'
'copy-job:Copies a job.'
'create-job:Creates a new job by reading stdin as a configuration XML file.'
'delete-builds:Deletes build record(s).'
'delete-job:Deletes a job'
'delete-node:Deletes a node'
'disable-job:Disables a job'
'disconnect-node:Disconnects from a node'
'enable-job:Enables a job'
'get-job:Dumps the job definition XML to stdout'
'groovy:Executes the specified Groovy script. '
'groovysh:Runs an interactive groovy shell.'
'help:Lists all the available commands.'
'install-plugin:Installs a plugin either from a file, an URL, or from update center. '
'install-tool:Performs automatic tool installation, and print its location to stdout. Can be only called from inside a build.'
'keep-build:Mark the build to keep the build forever.'
'list-changes:Dumps the changelog for the specified build(s).'
'login:Saves the current credential to allow future commands to run without explicit credential information.'
'logout:Deletes the credential stored with the login command. '
'mail:Reads stdin and sends that out as an e-mail.'
'offline-node:Stop using a node for performing builds temporarily, until the next "online-node" command.'
'online-node:Resume using a node for performing builds, to cancel out the earlier "offline-node" command.'
'quiet-down:Quiet down Jenkins, in preparation for a restart. Don't start any builds.'
'reload-configuration:Discard all the loaded data in memory and reload everything from file system. Useful when you modified config files directly on disk.'
'restart:Restart Jenkins'
'safe-restart:Safely restart Jenkins'
'safe-shutdown:Puts Jenkins into the quiet mode, wait for existing builds to be completed, and then shut down Jenkins.'
'set-build-description:Sets the description of a build.'
'set-build-display-name:Sets the displayName of a build'
'set-build-result:Sets the result of the current build. Works only if invoked from within a build.'
'shutdown:Immediately shuts down Jenkins server'
'update-job:Updates the job definition XML from stdin. The opposite of the get-job command'
'version:Outputs the current version.'
'wait-node-offline:Wait for a node to become offline'
'wait-node-online:Wait for a node to become online'
'who-am-i:Reports your credential and permissions'
)

local expl

_arguments '*:: :->subcmds' && return 0

if (( CURRENT == 1 )); then
  _describe -t commands "brew subcommand" _1st_arguments
  return
fi

case "$words[1]" in
  search|-S)
    _arguments \
      '(--macports)--macports[search the macports repository]' \
      '(--fink)--fink[search the fink repository]' ;;
  list|ls)
    _arguments \
      '(--unbrewed)--unbrewed[files in brew --prefix not controlled by brew]' \
      '(--versions)--versions[list all installed versions of a formula]' \
      '1: :->forms' &&  return 0

      if [[ "$state" == forms ]]; then
        _brew_installed_formulae
        _wanted installed_formulae expl 'installed formulae' compadd -a installed_formulae
      fi ;;
  install|home|homepage|log|info|abv|uses|cat|deps|edit|options)
    _brew_all_formulae
    _wanted formulae expl 'all formulae' compadd -a formulae ;;
  remove|rm|uninstall|unlink|cleanup|link|ln)
    _brew_installed_formulae
    _wanted installed_formulae expl 'installed formulae' compadd -a installed_formulae ;;
esac
