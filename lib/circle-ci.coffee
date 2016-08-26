CircleCiStatusView = require './circle-ci-status-view'

module.exports =
  view: null

  activate: ->
    atom.config.setDefaults 'circle-ci', apiToken: '', pollFrequency: 10, iconColor: false

    atom.packages.onDidActivateInitialPackages =>
      statusBar = document.querySelector('status-bar')
      if statusBar?
        @view ?= new CircleCiStatusView

    atom.commands.add 'atom-pane',
      'circle-ci:open': =>
        @view.openUrlInBrowser()

  deactivate: ->
    @view.destroy()
    @view = null
