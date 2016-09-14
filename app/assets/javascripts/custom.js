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
    var gameId = $(this).parent().parent().parent().find(".game-show").data("game-id");
    var gameParams = { game: {
      user_id: $("#current-user").val()
    }};
    $.ajax({
      type: 'DELETE',
      url: "/api/v1/games/" + gameId,
      success: function() {
        $("#standard-game").html('<p> The game was successfully deleted.</p>').addClass('deleted-game');
        $(".game-title").hide();
        $(".play-link").hide();
        $(".game-image").hide();
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
      var listItem = "<li><a href='/" + newGame.slug + "'>" + newGame.name + "</a></li>";
      $("#one-game").append(listItem);
    },
    error: function(xhr) {
      var errorObject = xhr.responseJSON.errors;
      var errorKeys = Object.keys(errorObject);
      for(var i = 0; i < errorKeys.length; i++){
        errorObject[errorKeys[i]].forEach(function(error) {
          $("#welcome").append("<span>" + errorKeys[i] + ':' + error + "</span>").css('background-color', '#ffcccc');
        });
      }
    }
  });
}
