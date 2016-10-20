$(document).ready(function() {
  $("#create-game").on('click', function(){
    if ($("#game-check").val() === "complete") {
      var gameParams = {  game: {
                          user_id: $("#current-user").val(),
                          name: $("#game-name").val(),
                          heroku_url: $("#game-heroku").val(),
                          github_url: $("#game-github").val(),
                          screenshot_or_gif: $("#game-screenshot").val(),
                          turing_password: $("#game-check").val(),
                          }
                        };
      createGame(gameParams);
    } else {
      $('#welcome').append('Invalid wifi password. Try again.').css('background-color', '#ffcccc');
    }
  });

  $("#update-game").on('click', function () {
    var gameId = $(this).parent().parent().parent().find(".game-show").data("game-id");
    var gameParams = { game: {
      id: gameId,
      user_id: $("#current_user").val(),
      name: $("#game-name").val(),
      heroku_url: $("#game-heroku").val(),
      github_url: $("#game-github").val(),
      screenshot_or_gif: $("#game-screenshot").val(),
    }};
    $.ajax({
      type: 'PATCH',
      url: "/api/v1/games/" + gameId,
      data: gameParams,
      success: function () {
        paramaterized = gameParams.game.name.toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/(^-|-$)/g,'');
        window.location = "/" + paramaterized;
      }
    });
  });

  $("#destroy-game").on('click', function(){
    var gameId = $(this).parent().parent().parent().find(".game-show").data("game-id");
    var gameParams = { game: {
      user_id: $("#current-user").val()
    }};
    $.ajax({
      type: 'DELETE',
      url: "/api/v1/games/" + gameId,
      success: function() {
        window.location = "/games";
      }
    });
  });
});


function createGame(gameParams) {
  $.ajax({
    type: 'POST',
    url: "/api/v1/games",
    data: gameParams,
    dataType: "json",
    success: function(newGame) {
        paramaterized = gameParams.game.name.toLowerCase().replace(/[^a-z0-9]+/g,'-').replace(/(^-|-$)/g,'');
        window.location = "/" + paramaterized;
        return false;
    },
    error: function(xhr) {
      var errorObject = xhr.responseJSON.errors;
      var errorKeys = Object.keys(errorObject);
      for(var i = 0; i < errorKeys.length; i++){
        errorObject[errorKeys[i]].forEach(function(error) {
          $("#welcome").append("<span>" + errorKeys[i] + ': ' + error + " " + "</span>").css('background-color', '#ffcccc');
        });
      }
    }
  });
}
