@timeComponent = React.createClass
  getInitialState: ->
    time: new Date()
  componentDidMount: ->
    setTimeout =>
      @setState(time: new Date())
    , 1000
  render: ->
    <input type='date' value={ @state.time }/>
