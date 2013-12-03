casper.test.begin "Todo E2E Test",  5,  suite = (test) ->
  casper.start "http://localhost:9000",  ->
    test.assertTitle "backbone_generator_sample",  "titleが正しい"
    test.assertExists "form[class=input-append]",  "main form is found"
    @fill "form[class=input-append]", todo: "Washing car", true

  casper.then ->
    test.assertTitle "backbone_generator_sample",  "titleが正しい"
    test.assertUrlMatch "/",  "search term has been submitted"
    test.assertEval (->
      __utils__.findAll("ul.todo-list").length >= 1
    ),  "Washing car"

  casper.run ->
    test.done()
