angular.module('beamng.apps').directive('crashTeleportApp', ['bngApi', function(bngApi) {
  return {
    templateUrl: '/ui/modules/apps/crashTeleport/crashTeleportApp.html',
    replace: true,
    restrict: 'EA',
    link: function(scope) {
      scope.teleport = function() {
        bngApi.engineLua('crash_teleport.teleportRandomCrash()')
      }
    }
  }
}])
