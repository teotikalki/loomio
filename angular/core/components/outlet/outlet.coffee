angular.module('loomioApp').directive 'outlet', (AppConfig, $compile) ->
  restrict: 'E'
  replace: true
  link: (scope, elem, attrs) ->
    _.map window.Loomio.plugins.outlets[_.snakeCase(attrs.name)], (outlet) ->
      if !outlet.beta or AppConfig.showBetaPlugins
        elem.append $compile("<#{_.snakeCase(outlet.component)} />")(scope)
