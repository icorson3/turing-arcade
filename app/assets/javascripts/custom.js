$(document).ready(function() {
  $("#create-game").on('click', function(){
    var gameParams = {  game: {
                        user_id: $("#current-user").val(),
                        name: $("#game-name").val(),
                        heroku_url: $("#game-heroku").val(),
                        github_url: $("#game-github").val(),
                        screenshot_or_gif: $("#game-screenshot").val(),
                        }
                      };
    createGame(gameParams);
  });

  $("#update-game").on('click', function () {
    var gameId = $(this).parent().parent().parent().data("game-id");
    var gameParams = { game: {
      id: gameId,
      user_id: $("#current-user").val(),
      name: $("#game-name").val(),
      heroku_url: $("#game-heroku").val(),
      github_url: $("#game-github").val(),
      screenshot_or_gif: $("#game-screenshot").val(),
    }};
    $.ajax({
      type: 'PATCH',
      url: "/api/v1/games/" + gameId,
      data: gameParams,
    });
  });

  $("#destroy-game").on('click', function(){
    var gameId = $(this).parent().parent().parent().data("game-id");
    var gameParams = { game: {
      user_id: $("#current-user").val()
    }};
    $.ajax({
      type: 'DELETE',
      url: "/api/v1/games/" + gameId,
      success: function() {
        $("#game-content").html("<p> The game was successfully deleted </p>");
      }
    });
  });
});


function createGame(gameParams) {
  $.ajax({
    type: 'POST',
    url: "/api/v1/games",
    data: gameParams,
    success: function(newGame) {
      var listItem = "<li><a href='/" + newGame.slug + "'>" + newGame.name + "</a></li>";
      $("#one-game").append(listItem);
    },
  });
}
