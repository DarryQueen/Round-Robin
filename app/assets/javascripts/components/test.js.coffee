@Test = React.createClass
  render: ->
    React.DOM.h1 null,
      "Hello, #{@props.data.email}"
