angular.module('loomioApp').directive 'navbar', ->
  scope: {}
  restrict: 'E'
  templateUrl: 'generated/components/navbar/navbar.html'
  replace: true
  controller: ($scope, $rootScope, $window, Records, ModalService, SignInForm, AppConfig, AbilityService, $routeParams) ->
    parser = document.createElement('a')
    parser.href = AppConfig.baseUrl
    $scope.title = "Loading"
    $scope.officialLoomio = AppConfig.isLoomioDotOrg

    $scope.hostName = parser.hostname

    $scope.isLoggedIn = AbilityService.isLoggedIn

    $scope.homePageClicked = ->
      $rootScope.$broadcast 'homePageClicked'

    $scope.toggleSidebar = ->
      $rootScope.$broadcast 'toggleSidebar'

    $scope.signIn = ->
      ModalService.open SignInForm
